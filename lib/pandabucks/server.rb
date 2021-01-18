module Pandabucks
  class Server
    def initialize(app, sockets)
      @app = app
      @sockets = sockets
    end

    def run
      loop do
        begin
          process_client
        rescue Interrupt
          Pandabucks.logger.log("Server process Interupted, Finished pandabucks")
          return
        end
      end
    end

    private
    def process_client
      selections, _ = IO.select(@sockets)
      io, = selections

      begin
        socket, _ = io.accept
        http = Pandabucks::HTTP.new(socket, @app)
        http.handle
      ensure
        socket.close
      end
    end

  end
end