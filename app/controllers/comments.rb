post '/memes/:id/comment' do
  p params
  @meme = Meme.find(params[:id])
  comment = Comment.new(comment_content: params[:comment_content], commenter_id: current_user.id, commentable: @meme)
  if comment.save
    if request.xhr?
      p "the if"
      content_type :json
    else
      p "the else"
      @meme.reload
      redirect "/memes/#{@meme.id}"
    end
  else
    status 422
    @errors = comment.errors.full_messages
  end
end

post '/memes/:id/caption/:id' do
  p params
  # @meme = Meme.find(params[:id])
  @caption = Caption.find(params[:id])
  @meme = @caption.meme
  comment = Comment.new(comment_content: params[:comment_content], commenter_id: current_user.id, commentable: @caption)
  if comment.save
    if request.xhr?
      p "the if"
      content_type :json
    else
      p "the else"
      redirect "/memes/#{@meme.id}"
    end
  else
    status 422
    @errors = comment.errors.full_messages
  end
end
