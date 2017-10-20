get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = "Please enter a correct email and password or <a href='/users/new'>register here.</a>"
    erb :'/sessions/new'
  end
end

delete '/sessions' do
  session.delete(:user_id)
  redirect '/'
end
