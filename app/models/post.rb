class Post < ApplicationRecord
  has_many :interactions, :as => :interactionable, :dependent => :destroy
  belongs_to :user

  has_many :shares, :dependent => :destroy
  has_many :channels, through: :shares


  def profile
    self.user.profile if self.user
  end


end
