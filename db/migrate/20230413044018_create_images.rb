class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :image
      t.string :category
      t.string :color
      t.string :place
      t.text :caption
      t.date :Date_taken
      t.timestamps
    end
  end
end