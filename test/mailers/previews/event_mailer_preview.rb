# Preview all emails at http://localhost:3000/rails/mailers/event_mailer
class EventMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/event_mailer/notify

  #(site_name, site_url, situation_name, component_name, event_name, event_message, user_email, subscriptions_url)
  def notify
    EventMailer.notify(
      "Página de Status",
      "http://www.foobar.com.br",
      "Indisponibilidade parcial",
      "Painel de controle",
      "Problemas intermitentes",
      "Estamos observando problemas de performance para um grupo de usuários bla bla bla...",
      "foo@bar.com",
      "http://site.subscriptions.teste/9287349287492387kjh34k2j")
  end

end
