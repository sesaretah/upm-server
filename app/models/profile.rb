class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar
  
  def fullname
    "#{self.name} #{self.surename}"
  end


end
