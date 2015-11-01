class ApplicationController < ActionController::API
  def angular
    render :file => 'dist/index.html'
  end
end
