get '/index/:user_id' do

  redirect '/login' unless session[:user_id]

  erb :home
end
