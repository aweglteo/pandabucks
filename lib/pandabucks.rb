require "pandabucks/version"
require "pandabucks/logger"

module Pandabucks
  class Error < StandardError; end
  def self.logger
    @logger ||= Pandabucks::Logger.new
  end
end
