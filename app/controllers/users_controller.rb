get '/users/new' do
  if request.xhr?
    erb :'users/_registration_form', layout: false
  else
    erb :'users/new'
  end

end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    if request.xhr?
      "random"
    else
      redirect '/'
    end
  else
    status 422
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end

# get '/blah' do
#   session[:user_id] = nil
# end

# First chunk:
# New sesssion
# When getting to login, AJAXify(no redirects, bitch!)
