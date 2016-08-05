get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/' #need to send back to index/flashcardpage
    else
      erb :login
    end
end
