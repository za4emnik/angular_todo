class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.references :user, foreign_key: true, on_delete: :cascade
      t.string     :name

      t.timestamps
    end
  end
end
