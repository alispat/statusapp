class ComponentsController < WebController
  before_action :set_component, only: [:show, :edit, :update, :destroy]
  before_action :set_breadcrumbs_generic, except: [:destroy]
  before_action :set_breadcrumbs_on_creating, only: [:new, :create]
  before_action :set_breadcrumbs_on_editing, only: [:show, :edit, :update]

  def index
    @components = Component.all.page params[:page]
    authorize @components
  end

  def show
  end

  def new
    @component = Component.new
    authorize @component
  end

  def create
    @component = Component.new(component_params)
    authorize @component
    if @component.save
      redirect_to components_url, notice: "Salvo com sucesso"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @component.update(component_params)
      redirect_to components_url, notice: "Salvo com sucesso"
    else
      render :edit
    end
  end

  def destroy
    @component.destroy
    redirect_to components_url, notice: "Removido com sucesso"
  end

private

  def set_component
    @component = Component.find(params[:id])
    authorize @component
  end

  def component_params
    params.require(:component).permit(:name, :url, :description, :group_id, :situation_id)
  end

  def set_breadcrumbs_generic
    add_breadcrumb("Início","/")
    add_breadcrumb('Componentes',components_path)
  end

  def set_breadcrumbs_on_creating
    add_breadcrumb('Novo componente')
  end

  def set_breadcrumbs_on_editing
    add_breadcrumb(@component.name)
  end

end
