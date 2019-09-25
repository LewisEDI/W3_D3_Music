require("pry")
require_relative("../models/artists")
require_relative("../models/albulms")

# PizzaOrder.delete_all()
# Customer.delete_all()

artist1 = Artist.new({'name' => 'Ross'})
artist1.save()

albulm = Albulm.new({'title' => 'Life as a Coder', 'genre' => 'Alternative', 'artist_id' => artist1.id})
albulm.save()
binding.pry
nil
