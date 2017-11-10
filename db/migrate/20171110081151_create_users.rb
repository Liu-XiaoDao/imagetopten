class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string   'email',   null: false
      t.string   'name'
      t.string   'nickname'
      t.string   'title'
      t.string   'location'
      t.string   'uid'
      t.string   'description'
      t.integer  'vote'
      t.string   'favoriteimg'
      t.timestamps
    end
  end
end
