class CreateTextDates < ActiveRecord::Migration[7.0]
  def change
    create_table :text_dates do |t|
      t.string :date1
      t.string :date2
      t.string :date3
      t.integer :buyer_id,null: false, class_name: "User",foreign_key: "buyer_id"
      t.references :user,null: false, foreign_key: true
      t.references :text,null: false, foreign_key: true
      t.timestamps
    end
  end
end
