class DrinkTotalCalculator
  def initialize(params)
    @params = params
  end

  def total
    drink_price + additions_price
  end

  private

  def drink_price
    ::DrinksVolume.find(@params.fetch(:drinks_volume_id)).price
  end

  def additions_price
    ::DrinkAddition.where(id: @params.fetch(:additions, [])).pluck(:price).to_a.sum
  end
end
