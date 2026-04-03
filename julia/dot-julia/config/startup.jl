ENV["JULIA_EDITOR"] = "nvim"
ENV["JULIA_PKG_USE_CLI_GIT"] = true

atreplinit() do repl
    @eval using Revise
    # @eval using About
    @eval begin
        InteractiveUtils.define_editor(
            r"nvim", wait=true) do cmd, path, line
            `$cmd +$line $path`
        end
    end
    @eval begin
        using Logging: global_logger
        using MiniLoggers: MiniLogger
        global_logger(MiniLogger())
    end

    # In tmux, KittyTerminalImages.jl's raw APC sequences don't render correctly.
    # Use kitten icat instead, which handles tmux passthrough properly.
    if get(ENV, "TMUX", "") != "" && Sys.which("kitten") !== nothing
        @eval begin
            using ImageShow, ImageIO
            struct KittyIcatDisplay <: AbstractDisplay end

            function Base.display(::KittyIcatDisplay, x)
                if showable(MIME("image/png"), x)
                    mime, ext = MIME("image/png"), ".png"
                elseif showable(MIME("image/svg+xml"), x)
                    mime, ext = MIME("image/svg+xml"), ".svg"
                else
                    throw(MethodError(display, (KittyIcatDisplay(), x)))
                end
                buf = IOBuffer()
                show(buf, mime, x)
                tmpfile = tempname() * ext
                try
                    write(tmpfile, take!(buf))
                    run(`kitten icat --align left $tmpfile`)
                finally
                    rm(tmpfile, force=true)
                end
            end

            Base.displayable(::KittyIcatDisplay, ::MIME) = false
            Base.displayable(::KittyIcatDisplay, ::MIME"image/png") = true
            Base.displayable(::KittyIcatDisplay, ::MIME"image/svg+xml") = true

            pushdisplay(KittyIcatDisplay())
        end
    end
end

