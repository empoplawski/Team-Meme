require 'faker'

5.times do
  user = User.new(username: Faker::Internet.user_name, password: "password")
  user.email = Faker::Internet.safe_email(user.username)
  user.save
end

10.times do
  Caption.create(caption_content: Faker::Simpsons.quote, meme_id: rand(1..12), user_id: rand(1..5))
end

10.times do
  Comment.create(comment_content: Faker::TheFreshPrinceOfBelAir.quote, commenter_id: rand(1..5), commentable: Caption.find(rand(1..10)))
end


10.times do
  Vote.create(value: 1, voter_id: rand(1..5), votable: Caption.find(rand(1..10)))

end

Meme.create(photo: "images/99bugs.jpg", memer_id: rand(1..5))
Meme.create(photo: "images/callbacks.jpg", memer_id: rand(1..5))
Meme.create(photo: "images/cat.jpg", memer_id: rand(1..5))
Meme.create(photo: "images/debugging.jpg", memer_id: rand(1..5))
Meme.create(photo: "images/fibonacci.jpg", memer_id: rand(1..5))
Meme.create(photo: "images/gosling.jpg", memer_id: rand(1..5))
Meme.create(photo: "images/javascript.jpeg", memer_id: rand(1..5))
Meme.create(photo: "images/meme1.jpg", memer_id: rand(1..5))
Meme.create(photo: "images/queries.jpg", memer_id: rand(1..5))
Meme.create(photo: "images/semicolon.jpg", memer_id: rand(1..5))
Meme.create(photo: "images/tired.jpg", memer_id: rand(1..5))
Meme.create(photo: "images/xx.jpg", memer_id: rand(1..5))
Meme.create(photo: "images/yaomeme.png", memer_id: rand(1..5))

10.times do
  Comment.create(comment_content: Faker::HarryPotter.quote, commenter_id: rand(1..5), commentable: Meme.find(rand(1..10)))
end
