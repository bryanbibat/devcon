class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def all
        omniauth = request.env["omniauth.auth"]
        authentication  = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])

        if authentication
            flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => omniauth['provider']
            sign_in_and_redirect authentication.user
        else
            user = User.where(:email => omniauth['info']['email']).first
            if user
                user.name = omniauth['info']['name']
                user.authentications.create!(provider: omniauth['provider'], uid: omniauth['uid'])
                flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => omniauth['provider']
                sign_in_and_redirect user
            else
                flash[:notice] = "Registrations are not open yet, but please check back soon"
                redirect_to root_path
            end
        end
    end

    # todo add other provider
    alias_method :facebook, :all
end
