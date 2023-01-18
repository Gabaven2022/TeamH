class CreateTexts < ActiveRecord::Migration[7.0]
  def change
    create_table :texts do |t|
      t.string :text_name, null: false
      t.string :body
      t.integer :faculty, null: false
      t.string :text_image, null: false
      t.references :user,null: false, foreign_key: true
      t.timestamps
    end
  end
end
