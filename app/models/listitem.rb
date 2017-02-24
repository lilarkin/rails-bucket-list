class Listitem < ApplicationRecord
  validates_presence_of :title, :description, :bucketlist_id

  belongs_to :bucketlist
end
