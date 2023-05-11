# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


kenny = User.create(username: "kennyn",password:"password")
nitty = User.create(username: "nitty",password:"password")
sub1 = Sub.create(title: "cats",description: "I love cats!",user_id: 1)
sub2 = Sub.create(title: "guitars",description: "I love guitar!",user_id: 2)

