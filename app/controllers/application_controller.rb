class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :set_variables
  private

  def set_variables
    @seva_types =SevaType.where(id:Seva.where(status:"active").pluck(:seva_type_id)&.uniq )

end
    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    def user_role
      unless  (current_user.role?('admin') || current_user.role?('manager'))
        store_location
        flash[:danger] = "Sorry you don't have the permission for performing this action"
        redirect_to :root
      end
    end
end
