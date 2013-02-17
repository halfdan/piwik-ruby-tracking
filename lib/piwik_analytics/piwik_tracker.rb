module PiwikAnalytics
  class PiwikTracker

    @@methods = Hash.new

    def initialize
      @calls = Array.new
    end

    def method_missing(meth, *args, &block)
      name = camelize(meth.to_s)
      if valid_method?(name) && valid_arguments?(name, args)
        call = { method: name, args: args[0] }
        @calls.push call
        return nil
      else
        super
      end
    end

    def respond_to?(meth)
      name = camelize(meth.to_s)
      if valid_method?(name)
        true
      else
        super
      end
    end

    def render(async = false)
      result = Array.new
      @calls.each do |call|
        args = render_arguments call[:method], call[:args], async
        if async
          result << "_paq.push([#{call[:method]}])"
        else
          result << "piwikTracker.#{call[:method]}(#{args})"
        end
      end
      result.join "\n"
    end

  private
    def valid_method?(name)
      @@methods.has_key? name
    end

    def valid_arguments?(name, args)
      method = @@methods[name]
      # Right now we only accept hashes
      # ToDo: This is ugly, refactor?
      return false unless args[0].instance_of? Hash
      # Check each argument (name, optional)
      method.each do |arg|
        unless arg[:optional]
          return false unless args[0].has_key? arg[:name]
        end
      end
      # Return in order
      return true
    end

    # Need to be independent from ActiveSupport
    def camelize(str)
      str = str.split('_').map {|w| w.capitalize}.join
      str[0].downcase + str[1..-1]
    end

    def render_arguments(name, args, async)
      method = @@methods[name]
      list = Array.new
      method.each do |arg|
        aname = arg[:name]
	unless args[aname].nil?
          list << args[aname]
	else
          list << arg[:default]
	end
      end
      list.map(&:inspect).join(", ")
    end

  @@methods = {
    "setDocumentTitle" => [
      { name: :title, optional: false }
    ],  
    "setCustomUrl" => [
      { name: :url, optional: false }
    ],  
    "setReferrerUrl" => [
      { name: :url, optional: false }
    ],
    "setSiteId" => [
      { name: :site_id, optional: false }
    ],
    "trackGoal" => [
      { name: :id_goal, optional: false },
      { name: :custom_revenue, optional: true }
    ],
    "trackSiteSearch" => [
      { name: :keyword, optional: false },
      { name: :category, optional: true, default: false },
      { name: :search_count, optional: true, default: false }
    ],
    "setCustomVariable" => [
      { name: :index,  optional: false },
      { name: :name, optional: false },
      { name: :value, optional: false },
      { name: :scope, optional: true, default: "visit" }
    ],
    "deleteCustomVariable" => [
      { name: :index, optional: false },
      { name: :scope, optional: false }   
    ],
    "setCookieDomain" => [
      { name: :domain, optional: false }
    ],
    "setDomains" => [
      { name: :domains, optional: false }
    ],
    "setCookiePath" => [
      { name: :path, optional: false }
    ],
    "setIgnoreClasses" => [
      { name: :classes, optional: false }
    ],
    "setDownloadClasses" => [
      { name: :classes, optional: false }
    ],
    "setLinkClasses" => [
      { name: :classes, optional: false }
    ],
    "setLinkTrackingTimer" => [
      { name: :time, optional: false }
    ],
    "setDownloadExtensions" => [
      { name: :extensions, optional: false }
    ],
    "addDownloadExtensions" => [  
      { name: :extensions, optional: false }
    ],
    "enableLinkTracking" => [
      { name: :enable, optional: false }
    ],
    "setRequestMethod" => [
      { name: :method, optional: false }
    ]
  }
  end
end
