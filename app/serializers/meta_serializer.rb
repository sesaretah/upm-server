class MetaSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :meta_schema, :label
  #has_many :actuals, serializer: ActualSerializer
  
  def user_actuals
    if scope && scope[:user_id]
      user = User.find(scope[:user_id])
      actuals = object.actuals.where(user_id: user.id)
      ActiveModel::SerializableResource.new(actuals,  each_serializer: ActualSerializer ).as_json
    end
  end

  def meta_schema
    object.content
  end
end
