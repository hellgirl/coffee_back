json.partial! "api/v1/common/break_info"
json.drinks @payment_cards, partial: "payment_card", as: :payment_card
