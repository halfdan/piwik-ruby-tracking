require "piwik_analytics/helpers"

class HelpersDouble
  include PiwikAnalytics::Helpers
end

describe PiwikAnalytics::Helpers do
  describe "#piwik_tracking_tag" do
    before(:each) do
      @config = mock("Configuration").as_null_object
      @double = HelpersDouble.new
    end

    context "disabled" do
      it 'should return nil if disabled' do
        @config.stub(:disabled?).and_return true
        PiwikAnalytics.stub(:configuration).and_return @config
        @double.piwik_tracking_tag.should be_nil
      end
    end

    context "enabled" do
      before(:each) do
        @config.stub(:disabled?).and_return false
      end

      it 'should render' do
        PiwikAnalytics.stub(:configuration).and_return @config
        @double.should_receive(:render)
        @double.piwik_tracking_tag
      end

      it 'should use file piwik_tracking_tag' do
        PiwikAnalytics.stub(:configuration).and_return @config

        @double.should_receive(:render).with(hash_including(:file => 'piwik_analytics/piwik_tracking_tag'))
        @double.piwik_tracking_tag
      end
    end
  end
end
