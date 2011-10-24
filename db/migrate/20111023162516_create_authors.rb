class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :lname
      t.string :fname
      t.date :born_date

      t.timestamps
    end
  end
end
