class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :project, foreign_key: true, on_delete: :cascade
      t.string     :name
      t.string     :deadline
      t.integer    :position, index: true
      t.string     :aasm_state

      t.timestamps
    end
  end
end
