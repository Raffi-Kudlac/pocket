class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :value, null: true
      t.string :full_tag, null: false
      t.string :group_number, null: false
      t.string :element_number, null: false

      t.belongs_to :dicom_file, foreign_key: true
      t.timestamps
    end
  end
end
