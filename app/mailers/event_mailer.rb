class EventMailer < ApplicationMailer

  def notify(site_name, site_url, situation_name, component_name, event_name, event_message, user_email, subscriptions_url)
    @component_name = component_name
    @situation_name = situation_name
    @site_name = site_name
    @site_url = site_url
    @event_name = event_name
    @event_message = event_message
    @subscriptions_url = subscriptions_url
    mail to: user_email, subject: "[#{site_name}] #{situation_name} : #{component_name}"
  end

end
