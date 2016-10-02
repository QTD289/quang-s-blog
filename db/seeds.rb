# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
n = 0
while n < 10
  n += 1
  Tag.create(name: Faker::Book.genre)
end

m = 0
while m < 20
  m += 1
  User.create(email: Faker::Internet.email, password: '123456', password_confirmation: '123456')
end

i = 0
while i < 100
  i += 1
  Article.create(title: Faker::Book.title,
                 body: Faker::Lorem.paragraph(1 + rand(10)),
                 user_id: User.order("RANDOM()").first.id)
end

j = 0
while j < 500
  j += 1
  Tagging.create(article_id: Article.order("RANDOM()").first.id,
                 tag_id: Tag.order("RANDOM()").first.id)
  Comment.create(content: Faker::Lorem.sentence,
                 user_id: User.order("RANDOM()").first.id,
                 article_id: Article.order("RANDOM()").first.id)
end
