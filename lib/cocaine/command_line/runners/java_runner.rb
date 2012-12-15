module Cocaine
  class CommandLine
    class JavaRunner
      def call(command, env = {})
        proc = java.lang.getRuntime.exec(command)
        proc.waitFor
        stdout = proc.getInputStream
        out_io = stdout.to_io
        output = out_io.read
        out_io.close
        @exit_status = proc.exitValue
        output
      end
    end

    def exitStatus
      @exit_status || false
    end
  end
end