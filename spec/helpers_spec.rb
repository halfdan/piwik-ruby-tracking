require "piwik_analytics/helpers"

class HelpersDouble
  include PiwikAnalytics::Helpers
end

describe PiwikAnalytics::Helpers do
  describe "#piwik_tracking_tag" do
    before(:each) do
      @config = double("Configuration").as_null_object
      @double = HelpersDouble.new
    end

    context "disabled" do
      it 'should return nil if disabled' do
        allow(@config).to receive(:disabled?).and_return true
        allow(PiwikAnalytics).to receive(:configuration).and_return(@config)
        expect(@double.piwik_tracking_tag).to be_nil
      end
    end

    context "enabled" do
      before(:each) do
        allow(@config).to receive(:disabled?).and_return false
      end

      it 'should render' do
        allow(PiwikAnalytics).to receive(:configuration).and_return(@config)
        expect(@double).to receive(:render)
        @double.piwik_tracking_tag
      end

      it 'should use template piwik_tracking_tag' do
        allow(PiwikAnalytics).to receive(:configuration).and_return(@config)

        expect(@double).to receive(:render).with(hash_including(template: 'piwik_analytics/piwik_tracking_tag'))
        @double.piwik_tracking_tag
      end
    end
  end
end
