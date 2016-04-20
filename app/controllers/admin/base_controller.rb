class Admin::BaseController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'admin'

  before_action :authenticate_admin!
end
