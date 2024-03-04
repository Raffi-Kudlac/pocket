class DicomFile < ApplicationRecord
  has_many :tags, dependent: :destroy
end

# == Schema Information
#
# Table name: dicom_files
#
#  id         :integer          not null, primary key
#  file_name  :string           not null
#  png_url    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
