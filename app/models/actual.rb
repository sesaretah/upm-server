class Actual < ApplicationRecord
    belongs_to :meta
    belongs_to :user
    before_create :set_uuid

    def set_uuid
      self.uuid = SecureRandom.uuid
    end
end
