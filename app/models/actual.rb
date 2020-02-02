class Actual < ApplicationRecord
    belongs_to :meta
    belongs_to :user
    before_create :set_uuid

    def set_uuid
      self.uuid = SecureRandom.uuid
    end

    def completer 
      for item in self.content
        for schema in self.meta.meta_schema
          if schema['fid'] == item['fid']
            item['label'] = schema['label']
          end
        end
      end
    end
end
