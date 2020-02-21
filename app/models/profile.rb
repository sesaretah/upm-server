class Profile < ApplicationRecord
  after_save ThinkingSphinx::RealTime.callback_for(:profile)
  belongs_to :user
  has_one_attached :avatar
  
  def fullname
    "#{self.name} #{self.surename}"
  end


end
