class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.string :subjectname,     null:false
      t.string :title,           null:false
      t.text :content
      t.string :difficulty
      t.string :username,        null:false
      t.timestamps
    end
  end
end
