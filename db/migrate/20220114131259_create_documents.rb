class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.string :subjectname
      t.string :title
      t.text :content
      t.integer :difficulty
      t.string :username
      t.timestamps
    end
  end
end
