class Event < ApplicationRecord

  belongs_to :component
  belongs_to :situation

  validates :name, presence: true, length: { maximum: 255 }
  validates :message, presence: true
  validates :occourred_at, presence: true

  before_save :treat_occourred_on
  after_commit :update_component_status
  after_commit :notify_subscribers

  # NotifySubscribersJob.perform
  def self.notify_subscribers(event_id)
    event = Event.find(event_id) rescue nil
    if event
      config = Config.first
      situation = event.situation
      component = event.component
      component.users.each do |user|

        EventMailer.delay.notify(
          config.site,
          config.url,
          situation.name,
          component.name,
          event.name,
          event.message.gsub("\n", "<br>").html_safe,
          user.email,
          "#{config.url}#{Rails.application.routes.url_helpers.edit_subscription_path(user.public_token)}")

      end
    end
  end

private

  # before_save
  def treat_occourred_on
    self.occourred_on = occourred_at
  end

  # after_commit
  def update_component_status
    unless self.component.situation_id == self.situation_id
      if self.situation.maintenance? == false
        component.situation_id = self.situation_id
        component.save
      end
    end
  end

  # after_commit
  def notify_subscribers
    NotifySubscribersJob.perform_later(id) if notify?
  end


end
