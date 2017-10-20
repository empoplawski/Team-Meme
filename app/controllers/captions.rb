post '/memes/:id/caption' do
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
