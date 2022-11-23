class CreateTutorials < ActiveRecord::Migration[7.0]
  def change
    create_table :tutorials do |t|
      t.string :category
      t.string :author
      t.string :title
      t.text :description
      t.text :body
      t.integer :upvotes
      t.integer :downvotes

      t.timestamps
    end
  end
end
