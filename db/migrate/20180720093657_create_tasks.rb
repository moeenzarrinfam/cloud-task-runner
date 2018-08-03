class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true
      t.references :environment, foreign_key: true
      t.string :file
      t.string :name
      t.string :exec_command
      t.string :uid
      t.integer :status, default: 0
      t.numeric :running_time, default: 0

      t.timestamps
    end
  end
end
