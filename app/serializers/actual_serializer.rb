class ActualSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :content,:uuid
  #belongs_to :meta,  serializer: MetaSerializer
  belongs_to :user,  serializer: UserSerializer
end
