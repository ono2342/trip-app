class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.integer :country_id
      t.references :user, foreign_key: true
      t.timestamps null:true
    end
  end
end
