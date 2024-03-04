class CreateDicomFile < ActiveRecord::Migration[7.0]
  def change
    create_table :dicom_files do |t|
      t.string :file_name, null: false
      t.string :png_url, null: true
      t.timestamps
    end
  end
end
