require("pry")
require_relative("../models/artist")
require_relative("../models/albulm")

# PizzaOrder.delete_all()
# Customer.delete_all()

artist1 = Artist.new({'name' => 'Ross'})
artist1.save()

albulm1 = Albulm.new({'title' => 'Life as a Coder', 'genre' => 'Alternative', 'artist_id' => artist1.id})
albulm1.save()

albulm2 = Albulm.new({'title' => 'Life as a Alcoholic', 'genre' => 'Soul', 'artist_id' => artist1.id})
albulm2.save()

binding.pry
nil
