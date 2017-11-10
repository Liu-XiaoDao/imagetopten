class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string   'email'   null: false
      t.integer  'vote'
      t.string   'username'
      t.string   'favoriteimg'
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
