class RegistrationsController < Devise::RegistrationsController
  def new
    flash[:alert] = 'Registrations are not open yet, but please check back soon'
    redirect_to root_url
  end

  def create
    flash[:alert] = 'Registrations are not open yet, but please check back soon'
    redirect_to root_url
  end
end
