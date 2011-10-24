class CreateAuthorsBooks < ActiveRecord::Migration
  def change
    create_table :authors_books, :id => false do |t|
      t.references :author, :null => false
      t.references :book, :null => false
      t.string :pages, :null => true
      t.timestamps
    end
  end
end
