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

