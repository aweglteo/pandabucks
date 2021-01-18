require 'optparse'

module Pandabucks
  class CLI
    def initialize(argv)
      @argv = argv.dup
      setup_options

      begin
        args = @parser.parse(@argv)
      rescue OptionParser::InvalidOption => e
        Pandabucks.logger.log(e)
        exit 0
      end
    end
    
    def run
      # binding.pry
    end

    private
    def setup_options
      # default config options
      @options = {
        bind: "tcp://0.0.0.0",
        port: 12300,
        backlog: 1024, #maybe too big?
        resueaddre: true
      }
      @parser = OptionParser.new do |o|
        o.on "-v", "--version", "Print the version information" do
          puts "pandabucks version is #{VERSION}"
          exit 0
        end

        o.on "-b [VALUE]", "--bind", "bind URI to (tcp://)" do |arg|
          @options[:bind] = arg
        end

        o.on "-p [VALUE]", "--port", "Define the TCP port to bind" do |arg|
          @option[:port] = arg
        end

        o.on "--backlog [VALUE]", "Define the num of backlog" do |arg|
          @options[:backlog] = arg
        end

        o.on "--reuseaddr", "enable to restart pandabucks without wating timeout " do |arg|
          @options[:reuseaddr] = true
        end

      end
    end
  end
end
