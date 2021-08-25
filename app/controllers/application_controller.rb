class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_path # Vayase a la raiz
    end
end
