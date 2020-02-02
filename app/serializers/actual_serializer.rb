class ActualSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :content,:uuid, :meta_id
  #belongs_to :meta,  serializer: MetaSerializer
  belongs_to :user,  serializer: UserSerializer
  def content
    object.completer
  end
end
