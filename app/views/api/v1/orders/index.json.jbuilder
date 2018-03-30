json.partial! "api/v1/common/break_info"
json.draft @orders[Order.statuses[:draft]], partial: "order", as: :order
json.paid @orders[Order.statuses[:paid]], partial: "order", as: :order
json.prepared @orders[Order.statuses[:prepared]], partial: "order", as: :order
