class ApplicationController < ActionController::Base
    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_url, :alert => exception.message
    end
    def current_ability
        if current_admin
            return unless current_admin.present?
            @current_ability ||= Ability.new(current_admin)
        end
    end
end
