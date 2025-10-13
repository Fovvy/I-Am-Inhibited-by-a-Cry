class CreatePolls < ActiveRecord::Migration[8.0]
  def change
    create_table :polls do |t|
      t.string :title, null: false
      t.text :description
      t.datetime :closes_at
      t.boolean :allow_multiple, default: false
      t.string :share_code

      t.timestamps
    end
    add_index :polls, :share_code, unique: true
  end
end
