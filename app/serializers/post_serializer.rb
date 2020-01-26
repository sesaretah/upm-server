class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :draft, :content, :likes, :bookmarks, :follows, :liked, :bookmarked, :followed
  belongs_to :profile,  serializer: ProfileSerializer
  belongs_to :comments,  serializer: CommentSerializer

  def content
    object.send(:content).to_s
  end

  def liked
    object.liked(instance_options[:user_id])
  end

  def bookmarked
    object.bookmarked(instance_options[:user_id])
  end

  def followed
    object.followed(instance_options[:user_id])
  end
end
