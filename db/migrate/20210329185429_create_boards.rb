class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.string :name
      t.text :desc
      t.boolean :personal, :boolean, :default => false
      t.boolean :listed, :default => true
      t.boolean :public, :default => true

      t.timestamps
    end
  end
end
