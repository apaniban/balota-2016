class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  helper_method :resource_name, :resource, :devise_mapping, :resource_class

  def index
    if user_signed_in?
      redirect_to checklist_path and return
    end
  end

  def resource_name
    :user
  end

  def resource_class
    User
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
