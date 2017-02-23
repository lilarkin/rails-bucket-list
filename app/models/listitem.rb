class Listitem < ApplicationRecord
  validates_presence_of :title, :description, :complete, :bucketlist_id

  belongs_to :buckerlist
end
