r1 = Restaurant.create(name: 'Sottocasa NYC', address: '298 Atlantic Ave, Brooklyn, NY 11201')
r2 = Restaurant.create(name: 'PizzArte', address: '69 W 55th St, New York, NY 10019')

p1 = Pizza.create(name: 'Cheese', ingredients: 'Dough, Tomato Sauce, Cheese')
p2 = Pizza.create(name: 'Pepperoni', ingredients: 'Dough, Tomato Sauce, Cheese, Pepperoni')

r1.restaurant_pizzas.crweate(price: 10, pizza: p1)
r1.restaurant_pizzas.create(price: 12, pizza: p2)
r2.restaurant_pizzas.create(price: 15, pizza: p1)

