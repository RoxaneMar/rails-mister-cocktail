# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Ingredient.create(name: 'jus multifruits')
Ingredient.create(name: 'jus de mangue')
Ingredient.create(name: 'jus de pêche')
Ingredient.create(name: "jus d'orange")
Ingredient.create(name: "jus de pommes")
Ingredient.create(name: "jus de fraises")
Ingredient.create(name: "jus de goyaves")
Ingredient.create(name: "jus de tomates")
Ingredient.create(name: "liqueur de caramel")
Ingredient.create(name: "liqueur de pomme")
Ingredient.create(name: "jus de cramberries")
Ingredient.create(name: 'poudre de vanille')
Ingredient.create(name: 'sucre vanillé')
Ingredient.create(name: 'cointreau')

require 'json'
require 'open-uri'

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
serialized_drinks = open(url).read
drinks = JSON.parse(serialized_drinks)

i = 0

60.times do
  ingredient = Ingredient.create(name: drinks['drinks'][i]['strIngredient1'])
  i += 1
  ingredient.save!
end

