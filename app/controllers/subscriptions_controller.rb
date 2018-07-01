class SubscriptionsController < WebController

  skip_before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update]
  before_action :set_breadcrumbs_on_editing, only: [:edit, :update]

  def edit
  end

  def update
    if @user.update(subscriptions_params)
      redirect_to root_path, notice: "Salvo com sucesso"
    else
      render :edit
    end
  end

private

  def set_user
    @user = User.where('public_token = ?',params[:id]).first
    if @user
      authorize @user
    else
      redirect_to new_user_registration_path, flash: { error: "Seu e-mail não foi localizado" }
    end
  end

  def subscriptions_params
    params.require(:user).permit(component_ids: [])
  end


  def set_breadcrumbs_on_editing
    add_breadcrumb("Início","/")
    add_breadcrumb('Notificações')
  end

end
