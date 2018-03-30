# frozen_string_literal: true
class BreakService
  REDIS_KEY = "break_till"

  def initialize
    @redis = ::Redis.new
  end

  def set(break_length)
    return unless break_length
    @redis.set(REDIS_KEY, Time.zone.now + break_length.to_i.minutes)
  end

  def break_till
    break_till_time = @redis.get(REDIS_KEY)
    return break_till_time if break_till_time.blank? || Time.zone.now < break_till_time
    @redis.del(REDIS_KEY)
    nil
  end
end
