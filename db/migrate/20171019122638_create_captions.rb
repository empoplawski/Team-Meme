class CreateCaptions < ActiveRecord::Migration[5.1]
  def change
    create_table :captions do |t|
      t.string :caption_content, null: false
      t.integer :meme_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
