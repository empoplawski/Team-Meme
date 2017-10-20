get '/memes' do
  @memes = Meme.all
  erb :'memes/index'
end

get '/memes/:id' do
  @meme = Meme.find(params[:id])
  erb :"memes/show"
end
