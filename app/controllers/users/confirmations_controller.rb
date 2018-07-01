class Users::ConfirmationsController < Devise::ConfirmationsController

  def show

    super do |resource|
      resource.errors.clear
      sign_in(resource)
    end

  end

  private

    def after_confirmation_path_for(resource_name, resource)
      edit_subscription_path(resource.public_token)
    end

end
