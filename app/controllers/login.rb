get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/index/#{user.id}" #need to send back to index/flashcardpage
    else
      erb :login
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
<<<<<<< HEAD
=======

delete '/login' do
  session[:user_id] = nil
  redirect '/login'
end
>>>>>>> 84127c231d345f4a6760005b4b3e903ff67b36aa
