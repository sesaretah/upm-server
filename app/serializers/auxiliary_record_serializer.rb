class AuxiliaryRecordSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :auxiliary_table_id, :data_record, :title
  def data_record
    object.content
  end
end
