class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :comment_content, null: false
      t.string :commentable_type
      t.integer :commentable_id
      t.integer :commenter_id, null: false

      t.timestamps
    end
  end
end
