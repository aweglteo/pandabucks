
module Pandabucks
  class Launcher
    def initialize(port, bind, reuseaddr, backlog, config)
      @port = port
      @bind = bind
      @reuseaddr = reuseaddr
      @backlog = backlog
      @config = config
    end

    def run
      Pandabucks.logger.log("starting pandabucks server ...")
      Pandabucks.logger.log("(#{@bind}:#{@port})")

      begin
        socket = Socket.new(:INET, :STREAM)
        socket.setsockopt(:SOL_SOCKET, :SO_REUSEADDR, @reuseaddr)
        socket.bind(Addrinfo.tcp(@bind, @port))
        socket.listen(@backlog)

        application = load_app
        server = Pandabucks::Server.new(application, [socket])
        server.run
      ensure
        socket.close
      end
    end

    private
    def load_app
      raw = File.read(@config)
      builder = <<~BUILDER
      Rack::Builder.new do
        #{raw}
      end
      BUILDER
      eval(builder, nil, @config)
    end
  end
end