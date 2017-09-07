class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :set_initial

  private

  def set_initial
    @initial = Initial.last
    unless @initial
      @initial = Initial.set_default
    end
  end
end
