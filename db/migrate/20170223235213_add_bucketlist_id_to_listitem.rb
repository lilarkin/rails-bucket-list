class AddBucketlistIdToListitem < ActiveRecord::Migration[5.0]
  def change
    add_column :listitems, :bucketlist_id, :integer
  end
end
