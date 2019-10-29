class AuxiliaryRecord < ApplicationRecord
  belongs_to :auxiliary_table

  def title
    title_field_id = self.auxiliary_table.title_field_id
    for item in self.data_record
      return item['value'] if item['field_id'] == title_field_id
    end
  end

  def content
    auxiliary_table = self.auxiliary_table
    for item in self.data_record
      item['value'] = AuxiliaryRecord.find_by_id(item['value']).title if auxiliary_table.field_type(item['field_id']) == 'Table'
    end
  end
end
