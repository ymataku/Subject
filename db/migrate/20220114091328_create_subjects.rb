class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.string :subjectname,     null:false
      t.string :username,        null:false
      t.boolean :test
      t.timestamps
    end
  end
end
