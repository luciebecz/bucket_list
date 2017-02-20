class ListItem < ApplicationRecord
  validates_presence_of :item_name, :description, :do_by
  belongs_to :bucketlist
end
