class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :value, null: false
      t.string :votable_type
      t.integer :votable_id
      t.integer :voter_id, null: false

      t.timestamps
    end
  end
end
