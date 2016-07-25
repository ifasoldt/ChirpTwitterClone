class CreateTildetaggings < ActiveRecord::Migration[5.0]
  def change
    create_table :tildetaggings do |t|
      t.integer :tweet_id
      t.integer :tildetag_id

      t.timestamps
    end
  end
end
