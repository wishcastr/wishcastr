class ApplicationController < ActionController::API
  def angular
    render :file => 'public/index.html'
  end
end
