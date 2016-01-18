class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :city

      t.timestamps null: false
    end
  end
end
