get '/rounds/:round_id/users/:user_id' do
  @round = Round.last
  @user = User.find(session[:user_id])
  erb :'/rounds/show'
end