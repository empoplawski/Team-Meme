post '/memes/:id/captions' do
  @meme = Meme.find(params[:id])
  p caption = Caption.new(caption_content: params[:caption_content], user_id: current_user.id, meme_id: @meme.id)
  if caption.save
    if request.xhr?
      content_type :json
    else
      redirect "/memes/#{@meme.id}"
    end
  else
    status 422
    @errors = caption.errors.full_messages
  end
end

post '/memes/:id/captions/:id/upvote' do
  @caption = Caption.find(params[:id])
  @meme = @caption.meme
  # @caption.votes.create(voter_id: current_user.id, value: 1)
  new_vote = @caption.votes.new(voter_id: current_user.id, value: 1)
  vote_count = @caption.total_votes
  if !new_vote.save
    new_vote.delete
    vote_count -= 1
  end
    if request.xhr?
        p @caption.votes
        content_type :json
        {vote_count: vote_count}.to_json
    else
      redirect "/memes/#{@meme.id}"
    end
end

post '/memes/:id/captions/:id/downvote' do
  @caption = Caption.find(params[:id])
  @meme = @caption.meme
  new_vote = @caption.votes.new(voter_id: current_user.id, value: -1)
  vote_count = @caption.total_votes
  if !new_vote.save
    new_vote.delete
    # vote_count -= 1
  end
  if request.xhr?
      content_type :json
      {vote_count: vote_count}.to_json
  else
    redirect "/memes/#{@meme.id}"
  end
end

post '/memes/:meme_id/captions/:id/favorite' do
  authenticate!
  caption = Caption.find(params[:id])
  meme = caption.meme
  caption.favorite = true
  caption.save
  redirect "/memes/#{meme.id}"
end
