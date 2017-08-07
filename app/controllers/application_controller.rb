class ApplicationController < ActionController::Base
  skip_before_action :authenticate_user!, only: [:index, :show] 
  include Pundit
  protect_from_forgery with: :exception
end