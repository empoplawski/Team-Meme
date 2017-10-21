get '/memes' do
  @memes = Meme.all
  erb :'memes/index'
end

get '/memes/:id' do
  @meme = Meme.find(params[:id])
  p @meme.comments
  erb :"memes/show"
end

post '/memes/:id/upvote' do
  @meme = Meme.find(params[:id])
  @meme.votes.create(voter_id: current_user.id, value: 1)
  if request.xhr?
      content_type :json
      {vote_count: vote.value}
  else
    redirect "/memes/#{@meme.id}"
  end
end

post '/memes/:id/downvote' do
  @meme = Meme.find(params[:id])
  @meme.votes.create(voter_id: current_user.id, value: -1)

  if request.xhr?
      content_type :json
      {vote_count: vote.value}
  else
    redirect "/memes/#{@meme.id}"
  end
end

post '/memes' do
  authenticate!
  @meme = Meme.create(photo: "images/" + params[:photo][:filename], memer_id: current_user.id)
  @filename = params[:photo][:filename]
  file = params[:photo][:tempfile]
  File.open("./public/images/#{@filename}", "wb") do |f|
    f.write(file.read)
  end
  redirect '/'
end
