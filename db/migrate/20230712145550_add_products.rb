class AddProducts < ActiveRecord::Migration[7.0]
  def change
    Product.create({
      title: 'Hawaiian', 
      description: 'Hawaiian pizza is a pizza originating in Canada, and is traditionally topped with pineapple, tomato sauce, cheese, and either ham or bacon.', 
      price: 950, 
      size: 30, 
      is_spicy: false, 
      is_veg: false, 
      is_best_offer: false, 
      path_to_image: '/images/pizza_03.jpg'
    })

    Product.create({
      title: 'Pepperoni', 
      description: 'Pepperoni is an American variety of spicy salami made from cured pork and beef seasoned with paprika or other chili pepper. Prior to cooking, pepperoni is characteristically soft, slightly smoky, and bright red. Thinly sliced pepperoni is one of the most popular pizza toppings in American pizzerias.', 
      price: 750, 
      size: 30, 
      is_spicy: false, 
      is_veg: false, 
      is_best_offer: false, 
      path_to_image: '/images/pizza_02.jpg'
    })

    Product.create({
      title: 'Veggie', 
      description: 'Fresh tomatoes, onions, arugula, kale, eggplants, bell peppers, spinach, zucchini, mushrooms and more. They all make flavorsome vegetarian pizza toppings. Some vegetables need to be cooked or roasted to bring out their flavors.', 
      price: 950, 
      size: 30, 
      is_spicy: false, 
      is_veg: false, 
      is_best_offer: false, 
      path_to_image: '/images/pizza_01.jpg'
    })
  end
end
