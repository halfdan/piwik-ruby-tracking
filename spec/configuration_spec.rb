require "piwik_analytics/configuration"

describe PiwikAnalytics::Configuration do
  before(:each) do
    conf_mock = {
      "id_site"   => 4,
      "url"       => "example.com",
      "disabled"  => true
    }

    @config = PiwikAnalytics::Configuration.new
    allow(@config).to receive(:user_configuration).and_return(conf_mock)
  end
  it "returns a id_site" do
    expect(@config.id_site).to eq 4
  end
  it "returns a url" do
    expect(@config.url).to eq "example.com"
  end
  it "has a disabled? flag" do
    expect(@config.disabled?).to be_truthy
  end
end
