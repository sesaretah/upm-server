class ChannelSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :content, :likes, :bookmarks, :follows, :liked, :bookmarked, :followed, :posts
  belongs_to :profile,  serializer: ProfileSerializer
  #has_many :posts,  serializer: PostSerializer

  def posts
    result = []
    for post in object.posts
      result << PostSerializer.new(post).as_json
    end
    return result
  end

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
