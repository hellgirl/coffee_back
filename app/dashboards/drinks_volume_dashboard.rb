require "administrate/base_dashboard"

class DrinksVolumeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    drink: Field::BelongsTo,
    volume: Field::BelongsTo,
    price: Field::Number.with_options(decimals: 2),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :drink,
    :volume,
    :price,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :drink,
    :volume,
    :price,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :drink,
    :volume,
    :price,
  ].freeze

  # Overwrite this method to customize how drinks volumes are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(drinks_volume)
    "#{drinks_volume.drink.name} (#{drinks_volume.volume.volume})"
  end
end
