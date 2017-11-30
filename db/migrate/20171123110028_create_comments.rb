class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :task, foreign_key: true
      t.text :message
      t.string :attachment

      t.timestamps
    end
  end
end
