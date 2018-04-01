# frozen_string_literal: true
class NewOrderNotificationService
  FIREBASE_APP_KEY = "key=#{ENV['FIREBASE_APP_KEY']}"
  FIREBASE_SERVER_URL = "https://fcm.googleapis.com/fcm/send"

  def initialize(order)
    @order = order
  end

  def send_notification
    HTTP.auth(FIREBASE_APP_KEY).headers("Content-Type" => "application/json")
      .post(FIREBASE_SERVER_URL, json: notification)
  end

  private

  def notification
    { "notification": {
        "title": "Новый заказ",
        "body": coffee_description,
        "click_action": Rails.application.routes.url_helpers.staff_orders_path
      },
      "registration_ids": StaffUser.pluck(:notification_token) }
  end

  def coffee_description
    "#{@order.drinks_volume.drink.name} (#{@order.drinks_volume.volume.volume})
     #{@order.drink_additions.present? ? 'С добавлением: @order.drink_additions.pluck(:name).join(", ")' : 'Без добавок'}
     #{@order.comment}"
  end
end
