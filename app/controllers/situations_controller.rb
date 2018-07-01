class SituationsController < WebController
  before_action :set_situation, only: [:edit, :update]
  before_action :set_breadcrumbs_generic
  before_action :set_breadcrumbs_on_editing, only: [:edit, :update]

  def index
    @situations = Situation.all.page params[:page]
    authorize @situations
  end

  def edit
  end

  def update
    if @situation.update(situation_params)
      redirect_to situations_url, notice: "Salvo com sucesso"
    else
      render :edit
    end
  end


private

  def set_situation
    @situation = Situation.find(params[:id])
    authorize @situation
  end

  def situation_params
    params.require(:situation).permit(:name, :icon, :color)
  end

  def set_breadcrumbs_generic
    add_breadcrumb("Início","/")
    add_breadcrumb('Situações',situations_path)
  end

  def set_breadcrumbs_on_editing
    add_breadcrumb(@situation.name)
  end

end
