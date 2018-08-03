class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true
      t.references :environment, foreign_key: true
      t.string :file
      t.string :name
      t.string :execable

      t.timestamps
    end
  end
end
