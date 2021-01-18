require "spec_helper"

RSpec.describe Pandabucks::Logger do
  let(:stream) { double(:stream) }

  describe "#log" do
    it "proxies to stream" do
      logger = Pandabucks::Logger.new(stream)
      expect(stream).to receive(:puts).with("GoodBye")
      logger.log("GoodBye")
    end
  end

end
