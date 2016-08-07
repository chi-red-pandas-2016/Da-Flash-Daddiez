get '/' do
  erb :index
end

get '/users/:user_id' do

  redirect "/users/new" unless session[:user_id]
  @current_user = User.find(params[:user_id])
  erb :profile
end


#We need to make it so that once a user has logging in they will see the
