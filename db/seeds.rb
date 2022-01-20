# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Comment.destroy_all
Like.destroy_all
Post.destroy_all
User.destroy_all


Bruce = User.create!(name: 'Bruce Wayne', photo: Faker::LoremFlickr.image(size: "50x60") , bio: Faker::Lorem.paragraph, posts_counter: 3)
Dick = User.create!(name: 'Dick Grayson', photo: Faker::LoremFlickr.image(size: "50x60"), bio: Faker::Lorem.paragraph, posts_counter: 0)
Jason = User.create!(name: 'Jason Todd', photo: Faker::LoremFlickr.image(size: "50x60") , bio: Faker::Lorem.paragraph, posts_counter: 0)
Tim = User.create!(name: 'Tim Drake', photo: Faker::LoremFlickr.image(size: "50x60") , bio: Faker::Lorem.paragraph, posts_counter: 0)

post1 = Bruce.posts.create!(title: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 0).chop, text: Faker::Lorem.paragraph, comments_counter: 3, likes_counter: 1)
post2 = Bruce.posts.create!(title: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 0).chop, text: Faker::Lorem.paragraph, comments_counter: 2, likes_counter: 1)
post3 = Bruce.posts.create!(title: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 0).chop, text: Faker::Lorem.paragraph, comments_counter: 5, likes_counter: 1)

Dick.comments.create!(text: 'really nice post Michael', post: post1)
Jason.comments.create!(text: 'Well Done 👏👏👏', post: post1)
Tim.comments.create!(text: 'This is a great Read', post: post1)
Jason.comments.create!(text: 'Love Love 💓 it!!!', post: post2)
Tim.comments.create!(text: 'I have got soooooo much Love 💓 it!!!', post: post2)
Bruce.comments.create!(text: 'Love 💕 it Aswell !!!', post: post3)
Tim.comments.create!(text: 'This is a terific post ', post: post3)
Jason.comments.create!(text: 'This is a swell post ', post: post3)
Dick.comments.create!(text: 'This is a awesome post ', post: post3)
Dick.comments.create!(text: 'This is a horrible post ', post: post3)

Dick.likes.create!(post: post1)
Jason.likes.create!(post: post2)
Tim.likes.create!(post: post3)


p "Created #{User.count} Users #{Post.count} Posts #{Comment.count} Comments #{Like.count} Likes"
