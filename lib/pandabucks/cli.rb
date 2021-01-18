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
      binding.pry
    end

    private
    def setup_options()
      @parser = OptionParser.new do |o|
        o.on "-v", "--version", "Print the version information" do
          puts "pandabucks version is #{VERSION}"
          exit 0
        end
      end
    end
  end
end
