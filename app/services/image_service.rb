class ImageService
  PNG_IMAGE_PATH = "app/assets/created_png_files/"

  class << self

    def create_png_image(dicom_obj, file_name_prefix, dicom_file_id)
      image = dicom_obj.image
      full_path = PNG_IMAGE_PATH + file_name_prefix + "_#{dicom_file_id}" + ".png"
      image.normalize.write(full_path)

      return full_path # for testing this will be the path that the image is stored in
    end
  end
end