class CreateToilets < ActiveRecord::Migration[5.2]
  def change
    create_table :toilets do |t|
      t.integer :toilet_number
      t.boolean :open, default: true
      t.timestamps
    end
  end
end
