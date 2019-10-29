class Share < ApplicationRecord
  belongs_to :post
  belongs_to :channel
end
