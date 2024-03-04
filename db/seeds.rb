# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
BLOB_URL = "www.blob/"
puts "starting the seed ----"
puts "wiping the models  ----"

DicomFile.delete_all
Tag.delete_all

puts "creating the data  ----"

df = DicomFile.create(
  png_url: BLOB_URL + "1",
  file_name: "test.tsx"
)

DicomFile.create(
  png_url: BLOB_URL + "2",
  file_name: "classified.tsx"
)

Tag.create(
  full_tag: "0002,0000",
  group_number: "0002",
  element_number: "0000",
  value: "val",
  dicom_file: df
)

Tag.create(
  full_tag: "0002,0010",
  group_number: "0002",
  element_number: "0010",
  value: "res",
  dicom_file: df
)
