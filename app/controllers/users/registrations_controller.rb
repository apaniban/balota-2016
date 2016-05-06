class Users::RegistrationsController < Devise::RegistrationsController
  before_action :redirect_to_edit_checklist_path, only: [:edit, :update]
  protected
    def after_sign_up_path_for(resource)
      edit_checklist_path
    end

    def redirect_to_edit_checklist_path
      redirect_to edit_checklist_path and return if current_user.present? && current_user.registered_using_omniauth?
    end
end
