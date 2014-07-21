class SessionsController < ApplicationController
  def create
    sign_in
    flash[:notice] = '編集モードに切り替えました。'
    redirect_to root_url
  end

  def destroy
    sign_out
    flash[:notice] = '閲覧モードに切り替えました。'
    redirect_to root_url
  end
end
