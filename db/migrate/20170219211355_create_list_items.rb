class CreateListItems < ActiveRecord::Migration[5.0]
  def change
    create_table :list_items do |t|
      t.string :item_name, null: false
      t.text :description
      t.string :do_by
      t.belongs_to :bucketlist

      t.timestamps
    end
  end
end
