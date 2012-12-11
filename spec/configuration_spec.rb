require "piwik_analytics/configuration"

describe PiwikAnalytics::Configuration do
  before(:each) do
    conf_mock = {
      "id_site"   => 4,
      "url"       => "example.com",
      "use_async" => true,
      "disabled"  => true
    }

    @config = PiwikAnalytics::Configuration.new
    @config.stub(:user_configuration).and_return(conf_mock)
  end
  it "returns a id_site" do
    @config.id_site.should eq 4
  end
  it "returns a url" do
    @config.url.should eq "example.com"
  end
  it "has a use_async? flag" do
    @config.use_async?.should be_true
  end
  it "has a disabled? flag" do
    @config.disabled?.should be_true
  end
end
