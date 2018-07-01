class NotifySubscribersJob < ApplicationJob
  queue_as :default

  def perform(event_id)
    Event.notify_subscribers(event_id)
  end
end
