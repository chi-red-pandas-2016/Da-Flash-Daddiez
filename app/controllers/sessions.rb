before do
  @errors = Array.new
end

get '/sessions/new' do
  erb :"/sessions/new"
end

post '/sessions' do
  @user = User.find_by(username: params[:username])
  if @user && @user.authenticate(params[:plaintext_password])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors << "Invalid Username/Password"
    erb :"/sessions/new"
  end
end

delete '/sessions' do
  session[:user_id] = nil
  redirect "/sessions/new"
end
