helpers do

  def logged_in?
    session[:user_id] != nil
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if logged_in?
  end

  def authorize!
    redirect '/sessions/new' unless logged_in?
  end

def check_password
  @user.password == params[:password]
end

end
