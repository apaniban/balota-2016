class Admin::HomeController < Admin::BaseController
  def index
    @user_count = User.count
  end
end
