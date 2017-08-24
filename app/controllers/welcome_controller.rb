class WelcomeController < ApplicationController
  def index
    flash[:notice] = "get busy living or get busy dying..."
  end 
end
