class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = 'Access denied'
    redirect_to root_path
  end

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: :render_500
    rescue_from ActionController::RoutingError, with: :render_404
    rescue_from ActionController::UnknownController, with: :render_404
    rescue_from ActionController::UnknownAction, with: :render_404
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
  end

  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  private
  def render_404(exception)
    @not_found_path = exception.message
    render_error_page 404
  end

  def render_500(exception)
    @error = exception
    logger.error @error.message
    @error.backtrace.each { |e| logger.error e }
    render_error_page 500
  end

  def render_error_page(error)
    respond_to do |format|
      format.html { render template: "static_pages/error_#{error}", layout: 'layouts/application', status: error }
      format.all { render nothing: true, status: error}
    end
  end
end
