# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_03_03_212150) do
  create_table "dicom_files", force: :cascade do |t|
    t.string "file_name", null: false
    t.string "png_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "value"
    t.string "full_tag", null: false
    t.string "group_number", null: false
    t.string "element_number", null: false
    t.integer "dicom_file_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dicom_file_id"], name: "index_tags_on_dicom_file_id"
  end

  add_foreign_key "tags", "dicom_files"
end
