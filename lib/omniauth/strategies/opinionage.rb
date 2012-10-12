require 'omniauth-oauth2'

module OmniAuth

  module Strategies

    class Opinionage < OmniAuth::Strategies::OAuth2

      def initialize(*args)
        super

        @OAUTH_BASE_URL    = ENV['OAUTH_BASE_URL'] || "https://www.opinionage.com"
        @SERVICES_BASE_URL = ENV['SERVICES_BASE_URL'] || "https://opinionage.com/api"

        puts "OmniAuth::Opinionage OAUTH_BASE_URL=#{@OAUTH_BASE_URL} - SERVICES_BASE_URL=#{@SERVICES_BASE_URL}"
        @options[:client_options] = { :site          => @OAUTH_BASE_URL,
                                      :authorize_url => "/auth/authorize",
                                      :token_url     => "/auth/token",
                                      :url           => @OAUTH_BASE_URL, :ssl => { :verify => false } }

        @options[:mode]       = :query
        @options[:param_name] = 'access_token'

        @options[:token_params] = {
            :parse => :json
        }

      end

      uid { raw_info['user']['graph_id'] }

      info do
        user_info = raw_info['user']
        if user_info
          user_info.delete('id')
          user_info.delete('graph_id')
          user_info
        else
          { }
        end
      end

      def raw_info
        @raw_info ||= access_token.get(@SERVICES_BASE_URL + "/1/users/me").parsed || { }
      end

      def build_access_token
        verifier = request.params['code']
        client.auth_code.get_token(verifier, { :redirect_uri => callback_url }.merge(token_params.to_hash(:symbolize_keys => true)), { :mode       => :query,
                                                                                                                                       :param_name => 'access_token' })
      end

    end

  end

end