class MetaSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :meta_schema
  has_many :actuals, serializer: ActualSerializer
end
