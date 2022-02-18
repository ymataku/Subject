class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.string :subjectname
      t.string :username
      t.boolean :test
      t.timestamps
    end
  end
end
