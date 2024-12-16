module ApplicationHelper
  def translated_status(status)
    I18n.t("event_registration.status.#{status}")
  end
end
