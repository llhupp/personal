class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :fb_app_id, :isHomePage, :isPhotosPage, :isEventsPage,
    :isContactsPage, :isSongsPage, :fb_page_id, :fb_token

  private

  def isHomePage
    controller_name == 'home'
  end

  def isPhotosPage
    controller_name == 'photos'
  end

  def isEventsPage
    controller_name == 'events'
  end

  def isContactsPage
    controller_name == 'contacts'
  end

  def isSongsPage
    controller_name == 'songs'
  end

  def fb_page_id
    '719045114798186'
  end

  def fb_app_id
    @fb_app_id ||= ENV['FB_APP_ID']
  end

  def fb_token
    @fb_token ||= begin
      uri = URI("https://graph.facebook.com/oauth/access_token?client_id=#{fb_app_id}&client_secret=#{ENV['FB_SECRET']}&grant_type=client_credentials")
      res = Net::HTTP.get_response(uri)
      res.code == '200' ? JSON.parse(res.body)["access_token"] : nil
    end
  end
end

require 'net/http'
