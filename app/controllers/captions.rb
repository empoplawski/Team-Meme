post '/memes/:id/captions' do
  @meme = Meme.find(params[:id])
  caption = Caption.new(caption_content: params[:caption_content])
  if caption.save
    if request.xhr?
      content_type :json
    else
      redirect '/memes/#{@meme.id}'
    end
  else
    status 422
    @errors = caption.errors.full_messages
  end
end

post '/memes/:id/captions/:id/upvote' do
  @caption = Caption.find(params[:id])
  @meme = @caption.meme
  if @caption.votes.create(voter_id: current_user.id, value: 1)
    if request.xhr?
        content_type :json
        {vote_count: vote.value}
    else
      redirect "/memes/#{@meme.id}"
    end
  else
    # status 422
    @errors = vote.errors.full_messages
  end
end

post '/memes/:id/captions/:id/downvote' do
  @caption = Caption.find(params[:id])
  @meme = @caption.meme
  @caption.votes.create(voter_id: current_user.id, value: -1)
  if request.xhr?
      content_type :json
      {vote_count: vote.value}
  else
    redirect "/memes/#{@meme.id}"
  end
end

