class ShareSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :data, :klass

  def data
    object.post
  end

  def klass
    "Share"
  end
end
