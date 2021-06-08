class StatsController < ApplicationController

  def modules
    service = Statistics::ModuleServices.new(stats_params)
    service.modules
    rest_respond_service service
  end

  def top_modules
    service = Statistics::ModuleServices.new(stats_params)
    service.top_modules
    rest_respond_service service
  end

  def top_learners
    service = Statistics::UserServices.new(stats_params)
    service.top_learners
    rest_respond_service service
  end

  private

  def stats_params
    params.permit()
  end
end
