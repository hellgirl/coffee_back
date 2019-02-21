require "administrate/base_dashboard"

class OrderDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    versions: Field::HasMany.with_options(class_name: "PaperTrail::Version"),
    drinks_volume: Field::BelongsTo,
    user: Field::BelongsTo,
    drink_additions: Field::HasMany,
    payment: Field::HasOne,
    id: Field::Number,
    code: Field::String,
    status: Field::String.with_options(searchable: false),
    comment: Field::Text,
    total: Field::Number.with_options(decimals: 2),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :drinks_volume,
    :user,
    :status,
    :total,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :drinks_volume,
    :user,
    :drink_additions,
    :payment,
    :id,
    :code,
    :status,
    :comment,
    :total,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [].freeze

  # Overwrite this method to customize how orders are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(order)
    "#{order.drinks_volume.drink.name} (#{order.drinks_volume.volume.volume})"
  end
end
