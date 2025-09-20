class CreateTodos < ActiveRecord::Migration[8.0]
  def change
    create_table :todos do |t|
      t.string :title,  null: false, default: ""
      t.text :body, null: false, default: ""
      t.references :user, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: true
      t.timestamps
    end
  end
end
