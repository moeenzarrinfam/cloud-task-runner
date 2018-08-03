class CreateEnvironments < ActiveRecord::Migration[5.1]
  def change
    create_table :environments do |t|
      t.string :name
      t.string :interpreter
      t.string :file_extension
      t.boolean :active

      t.timestamps
    end
  end
end
