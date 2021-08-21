class RenameColumnInCourse < ActiveRecord::Migration[6.1]
  def change
    rename_column :courses, :about, :description
  end
end
