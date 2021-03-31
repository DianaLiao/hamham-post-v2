class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :board_id
      t.text    :content
      t.boolean :sticky
      t.boolean :approved, :default => true

      t.timestamps
    end
  end
end
