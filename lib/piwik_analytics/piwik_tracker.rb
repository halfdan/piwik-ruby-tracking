module PiwikAnalytics
  class PiwikTracker

    def initialize
      @methods = Array.new
    end

    def track_page_view
    end

    def enable_link_tracking
      method = __method__.to_s.camelize(:lower)
      @methods.push { method: method }
    end

    def set_document_title title
      method = __method__.to_s.camelize(:lower)
      call = { method: method, params: [title] }
      @methods.push call
    end

    def track_goal(options={})

    end

    def track_site_search(options={})

    end

    def set_custom_variable(options={})

    end

    def delete_custom_variable(options={})
    end
    

    def to_s
    end


  end
end
