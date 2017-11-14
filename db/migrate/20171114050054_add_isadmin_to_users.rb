class AddIsadminToUsers < ActiveRecord::Migration[5.1]
  def change
  	change_table :users do |t|
      t.integer :isadmin,     default: 0
    end
  end
end
