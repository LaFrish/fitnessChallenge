# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
# Goal.destroy_all
Log.destroy_all


Frish = User.create({firstName: "Farishta", LastName: "Haider",startWeight: "194", goalWeight: "130", email: "farishta.haider@gmail.com", password: "superman", password_confirmation: "superman", username: "LaFrish", created_at: "", updated_at:"", id: 1})

Stacey= User.create({firstName: "Stacey", LastName: "Christie", email: "stacey@gmail.com", password: "superman", password_confirmation: "superman",id: 2 })

Flog = Log.create({water: 1, sleep: 1, workout: 1, food:1 , user_id: 1})

 Slog = Log.create({water: 1, sleep: 1, workout: 2, food:1 , user_id: 2})
 # Flog2 = User.log.create({id: 20, water: 2, sleep: 1, workout: 1, food:1 , user_id: 7})
# Brandi= User.create({firstName: "Brandi", LastName: "",startWeight: "", goalWeight: ""})
#
# Sarah= User.create({firstName: "Sarah", LastName: "Butts",startWeight: "", goalWeight: ""})
#
# Brian= User.create({firstName: "Brian", LastName: "Rigby",startWeight: "", goalWeight: ""})
#
# Brig= User.create({firstName: "Brighid", LastName: "Griffin",startWeight: "", goalWeight: ""})
#
# Amy= User.create({firstName: "Amy", LastName: "Ruddell",startWeight: "", goalWeight: ""})
#
# Mike= User.create({firstName: "Mike", LastName: "Aiello",startWeight: "", goalWeight: ""})
#
# Kim= User.create({firstName: "Kim", LastName: "Le",startWeight: "", goalWeight: ""})
#
# Jen= User.create({firstName: "Jen", LastName: "Phillips",startWeight: "", goalWeight: ""})
