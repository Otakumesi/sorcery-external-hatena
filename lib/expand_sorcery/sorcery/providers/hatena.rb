require 'sorcery/providers/base'
require 'uri'

module Sorcery
  module Providers
    class Hatena < Base
      include Protocols::Oauth

      attr_accessor :scope

      def initialize
        super
        @site = 'https://www.hatena.com'
        @authorize_site = 'https://www.hatena.ne.jp'
        @user_info_url = 'http://n.hatena.com/applications/my.json'
        @request_token_path = '/oauth/initiate'
        @token_path = '/oauth/token'
        @auth_path = '/oauth/authorize'
      end

      def get_consumer
        ::OAuth::Consumer.new(
                              @key,
                              @secret,
                              site: @site,
                              request_token_url: @site + @request_token_path + "?scope=#{@scope}",
                              access_token_url: @site + @token_path,
                              authorize_url: @authorize_site + @auth_path,
                             )
      end

      def get_user_hash(access_token)
        response = access_token.get(@user_info_url)
        auth_hash(access_token).tap do |h|
          h[:user_info] = JSON.parse(response.body)
          h[:uid] = h[:user_info]["url_name"]
        end
      end

      def process_callback(params, session)
        args = {
                oauth_verifier: params[:oauth_verifier],
                request_token: session[:request_token],
                request_token_secret: session[:request_token_secret]
               }
        get_access_token(args)
      end

      def get_access_token(args)
        get_request_token(args[:request_token], args[:request_token_secret]).get_access_token({oauth_verifier: args[:oauth_verifier]})
      end

      def get_request_token(token = nil, secret = nil)
        return ::OAuth::RequestToken.new(get_consumer, token, secret) if token && secret
        get_consumer.get_request_token({
                                        oauth_callback: @callback_url,
                                        scope: @scope
                                       })
      end

      def login_url(params, session)
        req_token = self.get_request_token
        session[:request_token] = req_token.token
        session[:request_token_secret] = req_token.secret
        authorize_url({ request_token: req_token.token, request_token_secret: req_token.secret })
      end

      def authorize_url(args)
        get_request_token(
                          args[:request_token],
                          args[:request_token_secret],
                         ).authorize_url({oauth_callback: @callback_url})
      end
    end
  end
end
