class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.date :date
      t.text :description
      t.float :value
      t.references :responsible, index: true

      t.timestamps
    end
  end
end
