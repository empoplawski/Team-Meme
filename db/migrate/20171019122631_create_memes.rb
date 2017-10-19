class CreateMemes < ActiveRecord::Migration[5.1]
  def change
    create_table :memes do |t|
      t.string :photo_path, null: false
      t.integer :memer_id, null: false

      t.timestamps
    end
  end
end
