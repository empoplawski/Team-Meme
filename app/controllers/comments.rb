post '/memes/:id/comment' do
  p params
  @meme = Meme.find(params[:id])
  comment = Comment.new(comment_content: params[:comment_content], commenter_id: current_user.id, commentable: @meme)
  if comment.save
    if request.xhr?
      erb :"memes/_meme_comment_line", locals: { comment: comment, meme: @meme }, layout: false
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
      erb :"memes/_caption_comment_line", locals: { comment: comment, meme: @meme, caption: @caption }, layout: false
    else
      p "the else"
      redirect "/memes/#{@meme.id}"
    end
  else
    status 422
    @errors = comment.errors.full_messages
  end
end
