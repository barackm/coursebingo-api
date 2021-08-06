class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :author_id
      t.string :price
      t.text :about
      t.string :duration
      t.string :image

      t.timestamps
    end
  end
end
