spec = Gem::Specification.new do |s|
  s.name              = 'piwik_analytics'
  s.version           = '1.0.1'
  s.date              = Time.now.strftime "%Y-%m-%d"
  s.author            = 'Fabian Becker'
  s.email             = 'halfdan@xnorfz.de'
  s.homepage          = 'https://github.com/halfdan/piwik_analytics/'
  s.summary           = "[Rails] Easily include Piwik tracking in your Rails application."

  s.description = <<-DESC
    The piwik_analytics gem provides an easy way to include Piwik into your application.
    By default it will output the synchronous piwik tracking code for every page
    (given that it is configured correctly).    
  DESC
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]
                
  s.add_runtime_dependency 'rails', '>= 3.0.0'
  s.add_dependency 'actionpack'
  s.add_dependency 'activesupport'
end

