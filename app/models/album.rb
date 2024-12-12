class Album < ApplicationRecord
  belongs_to :event

  has_many_attached :media

  private

  def set_default_name
    self.name = "Album de l'évènement #{event.name}" unless name.present?
  end
end
