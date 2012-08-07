require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Opinionage < OmniAuth::Strategies::OAuth2

      option :client_options, { :site          => "https://opinionage.com",
                                :authorize_url => "/auth/authorize",
                                :token_url     => "/auth/token",
                              }

      option :token_params, {
          :parse => :json
      }

      extra do
        {
            :credentials => {
              :access_token => access_token.token
            }
        }
      end

    end
  end
end