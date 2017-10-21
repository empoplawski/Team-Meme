class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :value, default: 0
      t.string :voteable_type
      t.integer :voteable_id
      t.integer :voter_id, null: false

      t.timestamps
    end
  end

end
