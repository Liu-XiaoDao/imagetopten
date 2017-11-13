class CreateVoterecords < ActiveRecord::Migration[5.1]
  def change
    create_table :voterecords do |t|
      t.belongs_to :user, index: true
      t.belongs_to :image, index: true
      t.timestamps
    end
  end
end
