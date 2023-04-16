class Project < ApplicationRecord
  has_one_attached :screenshot
  validates :title, :github, :demo, :languages, presence: true

  def imageUrl
    if screenshot.present? && screenshot.attached?
      Rails.application.routes.url_helpers.url_for(screenshot)
    end
  end
end
