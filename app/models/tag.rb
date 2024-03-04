class Tag < ApplicationRecord
  belongs_to :dicom_file
end

# == Schema Information
#
# Table name: tags
#
#  id             :integer          not null, primary key
#  element_number :string           not null
#  full_tag       :string           not null
#  group_number   :string           not null
#  value          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  dicom_file_id  :integer
#
# Indexes
#
#  index_tags_on_dicom_file_id  (dicom_file_id)
#
# Foreign Keys
#
#  dicom_file_id  (dicom_file_id => dicom_files.id)
#
