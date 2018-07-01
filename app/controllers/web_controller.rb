class WebController < ApplicationController

  include Pundit

  before_action :authenticate_user!
  after_action :verify_authorized, unless: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def add_breadcrumb(title,link=nil,active=false)
    @breadcrumbs_array = [] if !@breadcrumbs_array
    @breadcrumbs_array << { title: title, link: link, active: active }
  end

  def user_not_authorized
    flash[:alert] = "Você não tem autorização para realizar esta ação"
    redirect_to(request.referrer || root_path)
  end

end
