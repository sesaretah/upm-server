class ProfileSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :fullname, :bio,  :avatar
  has_many :posts,  serializer: PostSerializer
  belongs_to :user

  def avatar
    if object.avatar.attached?
      rails_blob_url(object.avatar, only_path: true)
    end
  end
end
