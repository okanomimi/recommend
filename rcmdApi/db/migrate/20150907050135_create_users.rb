class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :items
      t.text :similarity

      t.timestamps
    end
  end
end
