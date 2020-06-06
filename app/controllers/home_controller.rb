class HomeController < ApplicationController
  def index
    @uploads = current_user.uploads
  end
end
