class EventsController < ApplicationController
  def index
    @fb_token = request_fb_token
  end
end
