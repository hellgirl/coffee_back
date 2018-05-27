json.partial! "api/v1/common/break_info"
json.drinks_by_category @drinks do |_category_id, drinks|
  json.category_name drinks.first.drink_category.name
  json.drinks drinks, partial: "drink", as: :drink
end
