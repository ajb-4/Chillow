class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :liker, null: false, foreign_key: {to_table: :users}
      t.references :home, null: false, foreign_key: {to_table: :homes}
      t.timestamps
    end
  end
end
