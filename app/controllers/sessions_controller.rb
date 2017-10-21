get '/sessions/new' do
  if request.xhr?
    erb :'sessions/_login_form', layout: false
  else
    erb :'sessions/new'
  end
end

post '/sessions' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    if request.xhr?
      erb :'sessions/_logged_in_links', layout: false
    else
      redirect '/'
    end
  else
    @errors = "Please enter a correct email and password or <a href='/users/new'>register here.</a>"
    erb :'sessions/new'
  end
end

delete '/sessions' do
  session.delete(:user_id)
  redirect '/'
end
