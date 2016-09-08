require 'sorcery/providers/base'
require 'active_support'
require 'active_support/core_ext'

module Sorcery
  module Providers
    class Line < Base
      include Protocols::Oauth2

      attr_accessor :state

      def initialize
        super
        @site = 'https://api.line.me'
        @user_info_path = '/v1/profile'
        @auth_site = "https://access.line.me"
        @auth_path = "/dialog/oauth/weblogin/"
        @token_path = '/v1/oauth/accessToken'
      end

      def get_user_hash(access_token)
        response = access_token.get(@user_info_path)
        auth_hash(access_token).tap do |h|
          h[:user_info] = JSON.parse(response.body)
          h[:uid] = h[:user_info]["mid"]
        end
      end

      def process_callback(params, session)
        args = {}.tap do |a|
          a[:code] = params[:code] if params[:code]
        end
        get_access_token(args, grant_type: "authentication_code", client_id: @key, client_secret: @secret, code: args[:code], redirect_uri: @callback_url)
      end

      def login_url(params, session)
        authorize_url
      end

      def authorize_url
        @auth_query = {response_type: "code", client_id: @key, redirect_uri: @callback_url, state: @state}.select {|k, v| v.present? }.to_param
        options = {
                   site: @site,
                   authorize_url: "#{@auth_site}#{@auth_path}/?#{@auth_query}",
                   token_url: @token_path
                  }
        super(options)
      end
    end
  end
end

