get '/memes' do
  @memes = Meme.all
  erb :'memes/index'
end

get '/memes/new' do
  erb :'memes/_new_meme_form', layout: false
end

get '/memes/:id' do
  @meme = Meme.find(params[:id])
  @captions = @meme.order_captions
  erb :"memes/show"
end

post '/memes/:id/upvote' do
  @meme = Meme.find(params[:id])
  new_vote = @meme.votes.new(voter_id: current_user.id, value: 1)
  vote_count = @meme.total_votes
  if !new_vote.save
    new_vote.delete
    vote_count -= 1
  end
  if request.xhr?
      content_type :json
      {vote_count: vote_count}.to_json
  else
    redirect "/memes/#{@meme.id}"
  end
end

post '/memes/:id/downvote' do
  @meme = Meme.find(params[:id])
  new_vote = @meme.votes.new(voter_id: current_user.id, value: -1)
  vote_count = @meme.total_votes
  if !new_vote.save
    new_vote.delete
    vote_count -= 1
  end
  if request.xhr?
      content_type :json
      {vote_count: vote_count}.to_json
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
