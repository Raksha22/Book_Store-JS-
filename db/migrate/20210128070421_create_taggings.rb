class CreateTaggings < ActiveRecord::Migration[6.1]
  def change
    create_table :taggings do |t|
      t.string :tag_name
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
