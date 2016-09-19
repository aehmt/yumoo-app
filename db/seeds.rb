def make_seeds
  make_users # uncomment this when
  make_foods
  make_moods
  make_recommendations
  make_ratings
  make_puns
end

def make_users
  User.destroy_all
  User.create!(username: 'Nata', email: 'nata@aol.com', password: 'nnnnnn')
  User.create!(username: 'Satu', email: 'satu@aol.com', password: 'ssssss')
  User.create!(username: 'Paige', email: 'paige@aol.com', password: 'pppppp')
  User.create!(username: 'Aehmet', email: 'ahhhmed@aol.com', password: 'aaaaaa')
  User.create!(username: 'Dereck', email: 'nick@aol.com', password: 'dddddd')
  User.create!(username: 'Natasha4', email: 'natasha@aol.com', password: 'nnnnnn')
  User.create!(username: 'SatuB', email: 'satub@aol.com', password: 'ssssss')
  User.create!(username: 'PaigeL', email: 'paigeL@aol.com', password: 'pppppp')
  User.create!(username: 'AehmetF', email: 'ahhhmedf@aol.com', password: 'aaaaaa')
  User.create!(username: 'DereckF', email: 'nickf@aol.com', password: 'dddddd')
  User.create!(username: 'Natali', email: 'natali@aol.com', password: 'nnnnnn')
  User.create!(username: 'SatuQ', email: 'satuq@aol.com', password: 'ssssss')
  User.create!(username: 'PaigeQ', email: 'paigeq@aol.com', password: 'pppppp')
  User.create!(username: 'AehmetQ', email: 'ahhhmedq@aol.com', password: 'aaaaaa')
  User.create!(username: 'DereckQ', email: 'nickq@aol.com', password: 'dddddd')
  User.create!(username: 'Natasha@', email: 'natashaq@aol.com', password: 'nnnnnn')
  User.create!(username: 'SatuBQ', email: 'satubq@aol.com', password: 'ssssss')
  User.create!(username: 'PaigeLQ', email: 'paigelq@aol.com', password: 'pppppp')
  User.create!(username: 'AehmetFQ', email: 'ahhhmedfq@aol.com', password: 'aaaaaa')
  User.create!(username: 'DereckFQ', email: 'nickfq@aol.com', password: 'dddddd')
  User.create!(username: 'DereckMQ', email: 'nickfmq@aol.com', password: 'dddddd')
end

def make_foods
  Food.destroy_all
  Food.create(name: 'Beef Au Poivre Empanadas')
  Food.create(name: 'Mezcal Chipotle Infused BBQ Chicken')
  Food.create(name: 'Mole Poblano')
  Food.create(name: 'Nurse Ginger Green Juice')
  Food.create(name: 'Power Breakfast')
  Food.create(name: 'Chicken Noodle Soup')
  Food.create(name: 'Power Breakfast')
  Food.create(name: 'Samurai Matcha Bowl')
  Food.create(name: 'Green Wonder')
  Food.create(name: 'Nutella Smores')
  Food.create(name: 'Lobster Cheese Fries')
  Food.create(name: 'Bison Burger')
  Food.create(name: 'Kale Ceasar Salad')
  Food.create(name: 'Tuna Collard Green Wrap')
  Food.create(name: 'Baby Spinach Salad with Cranberries and Almonds')
  Food.create(name: 'Spicy Salmon Rolls')
  Food.create(name: 'Salmon Sashimi')
  Food.create(name: 'The Catena Malbec')
  Food.create(name: 'La Marca Prosecco Champagne')
  Food.create(name: 'Black Truffle Tagliolini with Lobster')
  Food.create(name: 'Caviar Lobster Frittata')
  Food.create(name: 'Mashrooms pastrami')
  Food.create(name: 'Veggie Chips')
  Food.create(name: 'Kale Chips')
  Food.create(name: 'Frozen kefir')
end

def make_moods
  Mood.destroy_all
  Mood.create(name: 'Squirrel on Caffeine')   #1
  Mood.create(name: 'No more Whiskey in a Barn')
  Mood.create(name: 'Sleep No More')  #3
  Mood.create(name: 'Guilty Pleasure')
  Mood.create(name: 'Skinny-B')     #5
  Mood.create(name: 'Get it over with')

  Mood.create(name: 'Get it over with')  #7
  Mood.create(name: 'Squirrel on Caffeine')
  Mood.create(name: 'Underpaid Elf in Santa’s Sweatshop') #9
  Mood.create(name: 'Godzilla on a Diet')   #10
  Mood.create(name: 'Headaches with a Chance of Puke')  #11
  Mood.create(name: 'Butter in Sahara')

  Mood.create(name: 'Eating lobster in the Hamptons') #13
  Mood.create(name: 'Wine not?')
  Mood.create(name: 'Caviar & Champagne')   #15
  Mood.create(name: 'Sloth on a Sunday')
  Mood.create(name: 'Underpaid Elf in Santa’s Sweatshop')   #17
  Mood.create(name: 'Fish swimming in a Glacier')
end

def make_recommendations
  Recommendation.destroy_all
  50.times do
    Recommendation.create(
      food_id: Food.all.sample.id,
      mood_id: Mood.all.sample.id,
      rating:(1..5).to_a.sample )
  end
end

def make_ratings
  Rating.destroy_all
  500.times do
    Rating.create(
      user_id: User.all.sample.id,
      recommendation_id: Recommendation.all.sample.id,
      score:(1..5).to_a.sample,
      comment: [nil, 'Works for me everytime',
        'spot on!',
        'not the best but..',
        'meh', 'so true',
      ].sample
    )
  end
end

def make_puns
  Pun.destroy_all
  Pun.create(content: 'Looking to grab some nuts? Why nut? Climb a tree? Yes?Yes?Yes?Yes! God help us...', mood_id: 1)
  Pun.create(content: "It's coffee O'clock in Jitterburg!", mood_id: 1)
  Pun.create(content: "It's grape to see you!", mood_id: 2)
  Pun.create(content: "Go against the grain. Ferment it.", mood_id: 2)
  Pun.create(content: "You live in Seattle?", mood_id: 3)
  Pun.create(content: "Last cup of tomorrow.", mood_id: 3)
  Pun.create(content: "Getting guilty with it.", mood_id: 4)
  Pun.create(content: "Orange you glad it's dipped in chocolate?", mood_id: 4)
  Pun.create(content: "To bee or not to bee, Honey?", mood_id: 5)
  Pun.create(content: "You like it Beetless? Try Strawberry Salads Forever.", mood_id: 5)
  Pun.create(content: "I'm partial to render.", mood_id: 6)
  Pun.create(content: "Sticking with it requires True Grits", mood_id: 6)
  Pun.create(content: "I'm partial to render.", mood_id: 7)
  Pun.create(content: "Sticking with it requires True Grits", mood_id: 7)
  Pun.create(content: 'Looking to grab some nuts? Why nut? Climb a tree? Yes?Yes?Yes?Yes! God help us...', mood_id: 8)
  Pun.create(content: "It's coffee O'clock in Jitterburg!", mood_id: 8)
  Pun.create(content: 'Underpaid? Pry me a river!', mood_id: 9)
  Pun.create(content: 'Desserts? Byte me!', mood_id: 9)
  Pun.create(content: 'Is that thunder or are you hungry to see me?', mood_id: 10)
  Pun.create(content: 'Never again said no student ever.', mood_id: 11)
  Pun.create(content: 'Wilt not, buttercup.', mood_id: 12)
  Pun.create(content: "Don't be so shellfish!", mood_id: 13)
  Pun.create(content: "Republican rallies: now with white whine.", mood_id: 14)
  Pun.create(content: "Caviar, hmmpf! That's just a fancy name for fish eggs.", mood_id: 15)
  Pun.create(content: 'Zzzzzzeppole...', mood_id: 16)
  Pun.create(content: 'Underpaid? Pry me a river!', mood_id: 17)
  Pun.create(content: 'Desserts? Byte me!', mood_id: 17)
  Pun.create(content: 'Let it go, let it goooooo....', mood_id: 18)

end

make_seeds
