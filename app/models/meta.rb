class Meta < ApplicationRecord
    has_many :actuals, :dependent => :destroy
    has_many :users, through: :actuals

    before_create :add_fid

    def add_fid
      for item in self.meta_schema
        item['fid'] = SecureRandom.uuid
      end
    end
end
