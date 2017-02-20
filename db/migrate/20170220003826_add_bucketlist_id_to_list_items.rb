class AddBucketlistIdToListItems < ActiveRecord::Migration[5.0]
  def change
    add_column :list_items, :bucketlist_id, :integer, null: false
  end
end
