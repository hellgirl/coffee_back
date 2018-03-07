json.extract! drink, :id, :name, :coffee_image

json.volumes drink.drinks_volumes do |drinks_volume|
  json.name drinks_volume.volume.name
  json.volume drinks_volume.volume.volume
  json.price drinks_volume.price
end
