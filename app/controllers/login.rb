get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      @login_error = nil
      session[:user_id] = user.id
      redirect "/" #need to send back to index/flashcardpage

    else
      @login_error = "Username or Password incorrect"
      erb :login, :layout => "layout.erb"
    end
end

get '/login/new' do
  erb :login_new
end
post '/login/new' do
  @errors = []
  @new_user = User.new(username: params[:username])
  @new_user.password = params[:password]
  @new_user.save
  @errors << @new_user.errors.full_messages

  redirect '/login' if @new_user.id
  erb :login_new
end

delete '/login' do
  session[:user_id] = nil
  redirect '/login'
end
