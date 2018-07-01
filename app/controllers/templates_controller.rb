class TemplatesController < WebController
  before_action :set_template, only: [:show, :edit, :update, :destroy]
  before_action :set_breadcrumbs_generic, except: [:destroy]
  before_action :set_breadcrumbs_on_creating, only: [:new, :create]
  before_action :set_breadcrumbs_on_editing, only: [:show, :edit, :update]

  def index
    @templates = Template.all.page params[:page]
    authorize @templates
  end

  def show
  end

  def new
    @template = Template.new
    authorize @template
  end

  def create
    @template = Template.new(template_params)
    authorize @template
    if @template.save
      redirect_to templates_url, notice: "Salvo com sucesso"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @template.update(template_params)
      redirect_to templates_url, notice: "Salvo com sucesso"
    else
      render :edit
    end
  end

  def destroy
    @template.destroy
    redirect_to templates_url, notice: "Removido com sucesso"
  end

private

  def set_template
    @template = Template.find(params[:id])
    authorize @template
  end

  def template_params
    params.require(:template).permit(:name, :message)
  end

  def set_breadcrumbs_generic
    add_breadcrumb("Início","/")
    add_breadcrumb('Templates',templates_path)
  end

  def set_breadcrumbs_on_creating
    add_breadcrumb('Novo template')
  end

  def set_breadcrumbs_on_editing
    add_breadcrumb(@template.name)
  end

end
