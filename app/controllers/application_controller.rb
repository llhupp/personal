class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :fb_app_id

  private

  def fb_app_id
    @fb_app_id ||= ENV['FB_APP_ID']
  end

  def request_fb_token
    @fb_token ||= begin
      uri = URI("https://graph.facebook.com/oauth/access_token?client_id=#{fb_app_id}&client_secret=#{ENV['FB_SECRET']}&grant_type=client_credentials")
      res = Net::HTTP.get_response(uri)
      res.code == '200' ? res.body.split('=')[1] : nil
    end
  end
end

require 'net/http'
