module PiwikAnalytics
  module Helpers
    def piwik_tracking_tag
      config = PiwikAnalytics.configuration
      return if config.disabled?

      if config.use_async?
        tag = <<-CODE
        <!-- Piwik -->
        <script type="text/javascript">
        var _paq = _paq || [];
        (function(){
            var u=(("https:" == document.location.protocol) ? "https://#{config.url}/" : "http://#{config.url}/");
            _paq.push(['setSiteId', #{config.id_site}]);
            _paq.push(['setTrackerUrl', u+'piwik.php']);
            _paq.push(['trackPageView']);
            var d=document,
                g=d.createElement('script'),
                s=d.getElementsByTagName('script')[0];
                g.type='text/javascript';
                g.defer=true;
                g.async=true;
                g.src=u+'piwik.js';
                s.parentNode.insertBefore(g,s);
        })();
        </script>
        <!-- End Piwik Tag -->
        CODE
        tag.html_safe
      else
        tag = <<-CODE
        <!-- Piwik -->
        <script type="text/javascript">
        var pkBaseURL = (("https:" == document.location.protocol) ? "https://#{config.url}/" : "http://#{config.url}/");
        document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
        </script><script type="text/javascript">
        try {
                var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", #{config.id_site});
                piwikTracker.trackPageView();
                piwikTracker.enableLinkTracking();
        } catch( err ) {}
        </script>
        <!-- End Piwik Tag -->
        CODE
        tag.html_safe
      end
    end
  end
end
