class CreateLegalPages < ActiveRecord::Migration
  def change
    create_table :local_legal_pages do |t|
      t.text :title
      t.text :body
      t.integer :translation_id

      t.timestamps null: false
    end
  end
end
