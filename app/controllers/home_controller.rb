class HomeController < WebController

  skip_before_action :authenticate_user!

  def index
    if params[:d].present?
      @start_day = Date.strptime(params[:d], '%Y-%m-%d') rescue Date.today - 6.days
    else
      @start_day = Date.today - 6.days
    end
    @end_day = @start_day + 6.days
    authorize :home, :index?
  end
end
