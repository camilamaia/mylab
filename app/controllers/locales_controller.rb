class LocalesController < ApplicationController

  def select
    @locale = params[:id]
    I18n.locale = @locale
    set_locale_and_redirect
  end

  private

  def set_locale_and_redirect
    current_user.update(locale: @locale) if current_user
    redirect_to home_path
  end

end
