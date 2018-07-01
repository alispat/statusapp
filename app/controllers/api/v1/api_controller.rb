class Api::V1::ApiController < ActionController::API

  acts_as_token_authentication_handler_for User
  before_action :require_authentication!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

    def require_authentication!
      throw(:warden, scope: :user) unless current_user.presence #&& current_user.admin?
    end

    def user_not_authorized
      render json: {}, status: 401
    end

    def record_not_found
      render json: {}, status: 424 # Failed Dependency (WebDAV)
    end

end
