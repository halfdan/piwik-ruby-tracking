require "erb"

describe "views/piwik_tracking_tag_async.html.erb" do
  before(:each) do
    filename = File.join(File.dirname(__FILE__), '..', '..', 'app', 'views', 'piwik_analytics', 'piwik_tracking_tag_async.html.erb')
    @template = ERB.new(File.read(filename))
  end

  it "should render url" do
    url = "example.com"
    id_site = nil
    @template.result(binding).should =~ /http:\/\/example.com/
  end

  it "should render id_site" do
    url = nil
    id_site = 4
    @template.result(binding).should =~ /'setSiteId', 4/
  end
end

