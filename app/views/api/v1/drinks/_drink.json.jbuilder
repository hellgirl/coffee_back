json.extract! drink, :id, :name, :description

json.image drink.coffee_image.url

json.volumes drink.drinks_volumes.joins(:volume).order("volumes.volume asc") do |drinks_volume|
  json.id drinks_volume.id
  json.name drinks_volume.volume.name
  json.volume drinks_volume.volume.volume
  json.price drinks_volume.price
end
