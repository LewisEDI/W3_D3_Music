require("pry")
require_relative("../models/artists")
require_relative("../models/albulms")

# PizzaOrder.delete_all()
# Customer.delete_all()

artist1 = Artist.new({'name' => 'Ross'})
# customer1.save()

albulm = Albulm.new({'title' => 'Life as a Coder', 'genre' => 'Alternative', 'artist_id' => artist1.id})
# order1.save
binding.pry
nil
