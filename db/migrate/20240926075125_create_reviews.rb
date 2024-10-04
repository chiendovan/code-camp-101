class CreateReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :reviews do |t|
      t.references :book, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
