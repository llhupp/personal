class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :isHomePage, :isContactsPage, :isSongsPage, :fb_page_id

  private

  def isHomePage
    controller_name == 'home'
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
end
