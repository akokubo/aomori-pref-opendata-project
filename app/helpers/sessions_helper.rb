module SessionsHelper
  def sign_in
    mode = 'edit'
    cookies.permanent[:mode] = mode
  end

  def edit_mode?
    !current_mode.nil?
  end

  def current_mode=(mode)
    @current_mode = mode
  end

  def current_mode
    @current_mode ||= cookies[:mode]
  end

  def sign_out
    self.current_mode = nil
    cookies.delete(:mode)
  end
end
