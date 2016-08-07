get '/' do
  "IDK what goes here"
end

get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(username: params[:username])
  @user.password = params[:hashed]
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end


get "/users/:id" do
  session[:user_id] != nil
  @user = User.find(params[:id])
    if @user.id
      erb :"/users/show"
    else
      redirect '/users/new'
    end
end
