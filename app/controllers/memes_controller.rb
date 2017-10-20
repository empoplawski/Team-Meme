get '/memes' do
  erb :'memes/index'
end

get '/memes/:id' do
  @meme = Meme.find(params[:id])
  erb :"memes/#{meme.id}/show"
end
