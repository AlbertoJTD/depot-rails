class ApplicationController < ActionController::Base
  before_action :set_i18n_locale_from_params, :authorize

  def set_i18n_locale_from_params
    if params[:locale]
      if I18n.available_locales.map(&:to_s).include?(params[:locale])
        I18n.locale = params[:locale]
      else
        flash.now[:notice] = "#{params[:locale]} translations not available"
        logger.error flash.now[:notice]
      end
    end
    
    # puts "Este es el lenguaje: #{params[:locale]}"
    # I18n.locale = params[:locale] || I18n.default_locale
  end

  #around_action :set_locale

  #def set_locale(&action)
    #puts "Este es el lenguaje: #{params[:locale]}"
    #locale = params[:locale] || I18n.default_locale
    #I18n.with_locale(locale, &action)
  #end

  protected

  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "Please log in"
    end
  end
end
