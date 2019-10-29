class UploadSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :link

  def link
    if object.image.attached?
      'http://localhost:3001' + rails_blob_url(object.image, only_path: true)
    end
  end
end
