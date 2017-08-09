# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do
    User.create(
        email: Faker::Internet.unique.email,
        password: "password"
    )
end

25.times do
    Wiki.create(
        title: Faker::Overwatch.unique.quote,
        body: Faker::Lorem.paragraph,
        user: User.all.sample
    )
end