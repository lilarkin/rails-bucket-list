class CreateListitems < ActiveRecord::Migration[5.0]
  def change
    create_table :listitems do |t|
      t.string :title
      t.string :description
      t.boolean :complete

      t.timestamps
    end
  end
end
