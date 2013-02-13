require 'piwik_analytics/piwik_tracker'

describe PiwikAnalytics::PiwikTracker do
  before(:each) do
    @tracker = PiwikAnalytics::PiwikTracker.new
  end

  describe "#respond_to" do
    it { should respond_to(:set_document_title) }
    it { should respond_to(:set_custom_url) }
    it { should respond_to(:set_referrer_url) }
    it { should respond_to(:set_site_id) }
    it { should respond_to(:track_goal) }
    it { should respond_to(:track_site_search) }
    it { should respond_to(:set_custom_variable) }
    it { should respond_to(:delete_custom_variable) }
    it { should respond_to(:set_cookie_domain) }
    it { should respond_to(:set_domains) }
    it { should respond_to(:set_cookie_path) }
    it { should respond_to(:set_ignore_classes) }
    it { should respond_to(:set_download_classes) }
    it { should respond_to(:set_link_classes) }
    it { should respond_to(:set_link_tracking_timer) }
    it { should respond_to(:set_download_extensions) }
    it { should respond_to(:add_download_extensions) }
    it { should respond_to(:enable_link_tracking) }
    it { should respond_to(:set_request_method) }

    it { should_not respond_to(:some_other_method) }
    it { should_not respond_to(:setLinkClasses) }
  end

  describe "#method_missing" do
    it "should raise" do
      expect { @tracker.some_other_method }.to raise_error(NoMethodError)
    end
  end

  describe "#render" do
    context "async" do
      
    end

    context "!async" do

    end
  end
end
