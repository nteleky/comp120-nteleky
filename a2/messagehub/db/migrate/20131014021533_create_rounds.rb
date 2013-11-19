class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :POpening
      t.integer :DOpening
      t.integer :PDirectAtt
      t.integer :PDirectWit
      t.integer :DCrossWit
      t.integer :PCrossWit
      t.integer :PClose
      t.integer :DClose

      t.timestamps
    end
  end
end
