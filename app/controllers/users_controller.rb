get '/users/new' do
  if request.xhr?
    erb :'users/_registration_form', layout: false
  else
    erb :'users/new'
  end

end

post '/users/new' do
  @user = User.new(params[:user])
  if @user.save
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end
