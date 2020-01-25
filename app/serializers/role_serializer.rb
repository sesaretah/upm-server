class RoleSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :ability, :default_role
  has_many :users,  serializer: UserSerializer
  def default_role
    object.default_role ? true : false
  end
end
