class Channel < ApplicationRecord
  after_save ThinkingSphinx::RealTime.callback_for(:channel)
  belongs_to :user
  has_many :interactions, :as => :interactionable, :dependent => :destroy

  has_many :shares, :dependent => :destroy
  has_many :posts, through: :shares

  def profile
    self.user.profile if self.user
  end

end
