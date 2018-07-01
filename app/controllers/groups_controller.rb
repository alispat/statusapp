class GroupsController < WebController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :set_breadcrumbs_generic, except: [:destroy]
  before_action :set_breadcrumbs_on_creating, only: [:new, :create]
  before_action :set_breadcrumbs_on_editing, only: [:show, :edit, :update]

  def index
    @groups = Group.all.page params[:page]
    authorize @groups
  end

  def show
  end

  def new
    @group = Group.new
    authorize @group
  end

  def create
    @group = Group.new(group_params)
    authorize @group
    if @group.save
      redirect_to groups_url, notice: "Salvo com sucesso"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to groups_url, notice: "Salvo com sucesso"
    else
      render :edit
    end
  end

  def destroy
    begin
      @group.destroy
      flash[:notice] = "Removido com sucesso"
    rescue ActiveRecord::DeleteRestrictionError
      flash[:error] = "Não foi possível remover o grupo pois há componentes associados"
    end
    redirect_to groups_url
  end

private

  def set_group
    @group = Group.find(params[:id])
    authorize @group
  end

  def group_params
    params.require(:group).permit(:name)
  end

  def set_breadcrumbs_generic
    add_breadcrumb("Início","/")
    add_breadcrumb('Grupos',groups_path)
  end

  def set_breadcrumbs_on_creating
    add_breadcrumb('Novo grupo')
  end

  def set_breadcrumbs_on_editing
    add_breadcrumb(@group.name)
  end

end
