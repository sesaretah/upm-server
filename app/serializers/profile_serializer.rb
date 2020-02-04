class ProfileSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :surename, :fullname,:bio,  :avatar, :metas
  #has_many :posts,  serializer: PostSerializer
  #has_many :actuals, serializer: ActualSerializer
  belongs_to :user
  
  def metas
    result = []
    #object.user.actuals.group_by(&:meta_id).each do |meta_id, actuals|
    #  meta = Meta.find(meta_id)
    for meta in Meta.all
      result << {meta: MetaSerializer.new(meta).as_json, actuals: ActiveModel::SerializableResource.new(meta.actuals,  each_serializer: ActualSerializer ).as_json}
    end
    return result
  end

  def avatar
    if object.avatar.attached?
      Rails.application.routes.default_url_options[:host] + rails_blob_url(object.avatar, only_path: true)
    end
  end
end
