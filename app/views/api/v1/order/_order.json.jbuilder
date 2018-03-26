json.extract! order, :id, :code, :status, :comment, :total

json.drink order.drinks_volumes do |drinks_volume|
  json.id drinks_volume.id
  json.drink drinks_volume.drink.name
  json.volume drinks_volume.volume.volume
end

json.drink_additions order.drink_additions do |drink_addition|
  json.id drink_addition.id
  json.name drink_addition.name
end
