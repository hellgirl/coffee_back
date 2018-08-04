json.partial! "api/v1/common/break_info"
json.test_payment Setting.pluck(:test_payment).first
json.payment_cards @payment_cards, partial: "payment_card", as: :payment_card
