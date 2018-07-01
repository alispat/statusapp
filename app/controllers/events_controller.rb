class EventsController < WebController
  before_action :load_templates, except: [:index, :show, :destroy]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_breadcrumbs_generic, except: [:destroy]
  before_action :set_breadcrumbs_on_creating, only: [:new, :create]
  before_action :set_breadcrumbs_on_editing, only: [:show, :edit, :update]

  def index
    @events = Event.all.page params[:page]
    authorize @events
  end

  def show
  end

  def new
    @event = Event.new(occourred_at: DateTime.now)
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    authorize @event
    if @event.save
      redirect_to events_url, notice: "Salvo com sucesso"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to events_url, notice: "Salvo com sucesso"
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: "Removido com sucesso"
  end

private

  def load_templates
    @templates = Template.all.order(:name)
  end

  def set_event
    @event = Event.find(params[:id])
    authorize @event
  end

  def event_params
    params.require(:event).permit(:component_id, :situation_id, :name, :message, :occourred_at, :notify)
  end

  def set_breadcrumbs_generic
    add_breadcrumb("Início","/")
    add_breadcrumb('Eventos',events_path)
  end

  def set_breadcrumbs_on_creating
    add_breadcrumb('Novo evento')
  end

  def set_breadcrumbs_on_editing
    add_breadcrumb(@event.name)
  end



end
