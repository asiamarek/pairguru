class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.references :user, index: true
      t.references :movie, index: true

      t.timestamps
    end
  end
end
