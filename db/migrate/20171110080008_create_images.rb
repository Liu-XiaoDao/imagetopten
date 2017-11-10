class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string   'url',   null: false
      t.integer  'Votes'
      t.string   'title'
      t.string   'describe'
      # t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
