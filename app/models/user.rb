class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile

  def assign(role_id)
    self.assignments = [] if self.assignments.blank?
    self.assignments << role_id
    self.save
  end

  def unassign(role_id)
    self.assignments -= [role_id] if !self.assignments.blank?
    self.save
  end

  
end
