class CreateFaces < ActiveRecord::Migration[5.1]
  def change
    create_table :faces do |t|
      t.string :faceId
      t.integer :top
      t.integer :left
      t.integer :width
      t.integer :height
      t.integer :anger
      t.integer :contempt
      t.integer :disgust
      t.integer :fear
      t.integer :happiness
      t.integer :neutral
      t.integer :sadness
      t.integer :surprise
    end
  end
end
