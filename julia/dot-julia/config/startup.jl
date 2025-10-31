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
end

