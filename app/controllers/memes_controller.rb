get '/memes' do
  @memes = Meme.all
  erb :'memes/index'
end
