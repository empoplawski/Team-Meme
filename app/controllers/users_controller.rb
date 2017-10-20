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
      erb :'sessions/_logged_in_links', layout: false
    else
      @errors = @user.errors.full_messages
      redirect '/users/new'
    end
  else
    status 422
    @errors = @user.errors.full_messages

    if request.xhr?
      @errors.to_json
    end
  end
end

# get '/blah' do
#   session[:user_id] = nil
# end

# First chunk:
# New sesssion
# When getting to login, AJAXify(no redirects, bitch!)
