class Post < ApplicationRecord
  after_save ThinkingSphinx::RealTime.callback_for(:post)
  has_many :interactions, :as => :interactionable, :dependent => :destroy
  belongs_to :user

  has_many :shares, :dependent => :destroy
  has_many :channels, through: :shares
  has_many :comments


  def profile
    self.user.profile if self.user
  end

  def share(channel_id)
    Share.create(shareable_type: 'Post', shareable_id: self.id, post_id: self.id , user_id: self.user_id, channel_id: channel_id.to_i)
  end

end
