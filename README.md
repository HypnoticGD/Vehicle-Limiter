This Script uses the Vehicle Category System to determine the Vehicle speeds for all Vehicles in that category.
Example: All Vehicles in Super are allowed to only drive 180. With that being edited to 180, all vehicles in that category are only driving 180 – 181 km/h.

to Add a new Category go in the Server.lua File and Add / Remove the category's you want or don't want

Category Example -
['super'] = { limitKMH = 120, limitMPH = 75 },
['compact'] = { limitKMH = 60, limitMPH = 32 },
