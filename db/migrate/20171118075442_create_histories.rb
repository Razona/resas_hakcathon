class CreateHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :histories do |t|
      t.float :lat
      t.float :lon
      t.string :kuriId
      t.string :userId 
      t.string :date
      t.integer :postTimes
      t.integer :kuriValue ,default: 1
    end
  end
end
