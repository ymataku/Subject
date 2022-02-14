class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.string :subjectname
      t.boolean :test
      t.timestamps
    end
  end
end
