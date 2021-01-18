require "socket"
require "time"
require "uri"
require "rack"

require "pandabucks/version"
require "pandabucks/logger"
require "pandabucks/launcher"
require "pandabucks/server"
require "pandabucks/http"
require "pandabucks/cli"

module Pandabucks
  def self.logger
    @logger ||= Pandabucks::Logger.new
  end
end
