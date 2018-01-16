class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :kuriValue , default: 0
      t.string :userId
      t.float :lat
      t.float :lon
    end
  end
end