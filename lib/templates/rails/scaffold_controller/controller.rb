<% if namespaced? -%>
require_dependency "<%= namespaced_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  before_action :set_<%= singular_table_name %>, only: [:show, :edit, :update, :destroy]
  before_action :set_breadcrumbs_generic, except: [:destroy]
  before_action :set_breadcrumbs_on_creating, only: [:new, :create]
  before_action :set_breadcrumbs_on_editing, only: [:show, :edit, :update]

  def index
    @<%= plural_table_name %> = <%= orm_class.all(class_name) %>.page params[:page]
    authorize @<%= plural_table_name %>
  end

  def show
  end

  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
    authorize @<%= singular_table_name %>
  end

  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "#{singular_table_name}_params") %>
    authorize @<%= singular_table_name %>
    if @<%= orm_instance.save %>
      redirect_to <%= plural_table_name %>_url, notice: "Salvo com sucesso"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @<%= orm_instance.update("#{singular_table_name}_params") %>
      redirect_to <%= plural_table_name %>_url, notice: "Salvo com sucesso"
    else
      render :edit
    end
  end

  def destroy
    @<%= orm_instance.destroy %>
    redirect_to <%= plural_table_name %>_url, notice: "Removido com sucesso"
  end

private

  def set_<%= singular_table_name %>
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
    authorize @<%= singular_table_name %>
  end

  def <%= "#{singular_table_name}_params" %>
    <%- if attributes_names.empty? -%>
    params[:<%= singular_table_name %>]
    <%- else -%>
    params.require(:<%= singular_table_name %>).permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
    <%- end -%>
  end

  def set_breadcrumbs_generic
    add_breadcrumb("Início","/")
    add_breadcrumb('<%= plural_table_name.capitalize %>',<%= plural_table_name %>_path)
  end

  def set_breadcrumbs_on_creating
    add_breadcrumb('Novo <%= singular_table_name.capitalize %>')
  end

  def set_breadcrumbs_on_editing
    add_breadcrumb(@<%= singular_table_name %>.name)
  end

end
<% end -%>
