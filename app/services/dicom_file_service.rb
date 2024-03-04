require 'dicom'
include DICOM

class DicomFileService
  class << self

    def get_tag(full_tag_name,  dicom_id)
      Tag.find_by(full_tag: full_tag_name, dicom_file_id:  dicom_id)&.value
    end

    def get_png_url(dicom_id)
      DicomFile.find_by(id: dicom_id)&.png_url
    end

    def create_dicom_file(url)
      new_dicom_file = nil
      error_count = 0

      #TODO - if transaction fails the image should be deleted
      ActiveRecord::Base.transaction do

        # in testing the url is really a file path
        dcm = DObject.read(url)
        file_name = url.split('/')[-1] #only works for file paths

        new_dicom_file = DicomFile.create(
          png_url: nil, # will also be a file path for testing purposes
          file_name: file_name,
        )

        file_name_prefix = file_name.split('.')[0]
        png_url = ImageService.create_png_image(dcm, file_name_prefix, new_dicom_file.id)
        new_dicom_file.update(png_url: png_url)

        res = dcm.each_tag do |full_tag|
          begin
            if full_tag.present? && dcm.value(full_tag).present?
              Tag.create(
                full_tag: full_tag,
                group_number: full_tag.split(',')[0].strip,
                element_number: full_tag.split(',')[1].strip,
                value: dcm.value(full_tag).to_s,
                dicom_file: new_dicom_file
              )
            end
          rescue ArgumentError
            puts "ERROR: an argument error was thrown for #{full_tag}"
            error_count += 1
          end
        end
      end
      puts "---Errors: #{error_count} tags failed to be created"

      return new_dicom_file&.id
    end
  end
end