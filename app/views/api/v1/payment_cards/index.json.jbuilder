json.partial! "api/v1/common/break_info"
json.payment_cards @payment_cards, partial: "payment_card", as: :payment_card
