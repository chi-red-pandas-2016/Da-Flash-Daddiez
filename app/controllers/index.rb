get '/' do
  erb :index
end



get '/users/:user_id' do

  redirect '/login' unless session[:user_id]
  @current_user = User.find(params[:user_id])
  erb :home
end
