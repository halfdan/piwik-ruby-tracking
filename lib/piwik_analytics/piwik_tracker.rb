module PiwikAnalytics
  class PiwikTracker

    def initialize
      @calls = Array.new
    end

    def method_missing(meth, *args, &block)
      name = meth.to_s.camlize(:lower)
      valid_method? name
      valid_arguments? args
      call = { method: name, args: args }
      @calls.push call
    end

    def to_s
      @calls.each do |call|
        
      end
    end

  private
    def valid_method?(name)
      @@methods.has_key? name
    end

    def valid_arguments?(name, args)
      method = @@methods[name]
      # Check each argument (name, optional)
      method.each do |arg|
        unless arg[:optional]
          return false unless args.has_key? arg[:name]
        end
      end
      # Return in order
      return true
    end
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
