class Project < ApplicationRecord
  has_one_attached :screenshot
  validates :title, :github, :demo, :languages, :screenshot, presence: true

  def imageUrl
    if screenshot.attached?
      Rails.application.routes.url_helpers.url_for(screenshot)
      # Rails.application.routes.url_helpers.rails_blob_path(screenshot)

    end
  end
end
