class ConfigsController < WebController
  before_action :authenticate_user!
  before_action :set_config, only: [:show, :edit, :update, :destroy]
  before_action :set_breadcrumbs_on_editing, only: [:show, :edit, :update]

  def edit
  end

  def update
    if @config.update(config_params)
      if params[:config][:remove_logo] == "1"
        @config.logo.purge_later
      end
      redirect_to edit_config_url, notice: "Salvo com sucesso"
    else
      render :edit
    end
  end

private

  def set_config
    @config = Config.first
    authorize @config
  end

  def config_params
    params.require(:config).permit(:site, :url, :description, :logo)
  end

  def set_breadcrumbs_on_editing
    add_breadcrumb("Início","/")
    add_breadcrumb('Configuração')
  end

end
