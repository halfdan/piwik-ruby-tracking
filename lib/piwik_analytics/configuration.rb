
module PiwikAnalytics
  class Configuration

    #
    # The url of the Piwik instance
    # Defaults to localhost
    #
    def url
      @url ||= (user_configuration_from_key('url') || 'localhost')
    end

    #
    # The ID of the tracked website
    # Defaults to 1
    #
    def id_site
      @id_site ||= (user_configuration_from_key('id_site') || 1)
    end

    #
    # Whether or not to use the async tracking
    # Defaults to false
    #
    def use_async?
      @use_async ||= (user_configuration_from_key('use_async') || false)
    end

    #
    # Whether or not to disable Piwik.
    # Defaults to false.
    #
    def disabled?
      @disabled ||= (user_configuration_from_key('disabled') || false)
    end

    private

    # 
    # return a specific key from the user configuration in config/piwik.yml
    #
    # ==== Returns
    #
    # Mixed:: requested_key or nil
    #
    def user_configuration_from_key( *keys )
      keys.inject(user_configuration) do |hash, key|
        hash[key] if hash
      end
    end

    #
    # Memoized hash of configuration options for the current Rails environment
    # as specified in config/piwik.yml
    #
    # ==== Returns
    #
    # Hash:: configuration options for current environment
    #
    def user_configuration
      @user_configuration ||= begin
        path = File.join(::Rails.root, 'config', 'piwik.yml')
        if File.exist?(path)
          File.open(path) do |file|
            processed = ERB.new(file.read).result
            YAML.load(processed)[::Rails.env]['piwik']
          end
        else
          {}
        end
      end
    end
  end
end
