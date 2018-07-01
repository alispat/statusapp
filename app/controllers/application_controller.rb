class ApplicationController < ActionController::Base

  before_action :set_config

  def set_config
    @config = Config.first rescue Config.new
  end

end
