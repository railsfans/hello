class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :student_number
      t.string :academy
      t.boolean :gender

      t.timestamps
    end
  end
end
