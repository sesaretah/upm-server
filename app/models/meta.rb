class Meta < ApplicationRecord
    has_many :actuals, :dependent => :destroy
    has_many :users, through: :actuals

    before_create :add_fid

    def add_fid
      for item in self.meta_schema
        item['fid'] = SecureRandom.uuid
      end
    end

    def content
      for item in self.meta_schema
        if item['type'] == 'Table'
           meta = Meta.where(title: item['ref']).first
           item['content'] = ActiveModel::SerializableResource.new(meta.actuals,  each_serializer: ActualSerializer ).as_json if meta
        end
      end
    end
end
