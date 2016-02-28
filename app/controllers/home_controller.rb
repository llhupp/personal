class HomeController < ApplicationController
  layout "landing", only: [:landing]

  def landing
  end

  def index
  end
end
