class Api::V1::MainController < ActionController::API
  EMPTY = {
    message: "No Data was found"
  }

  # Post
  # app/assets/dicom_files/IM000003.dcm
  def upload
    dicom_url = params[:url] # really a file path for testing
    resp = DicomFileService.create_dicom_file(dicom_url)
    if resp.present?
      render json: {
        sucess: true,
        identifier: resp
      }
    else
      render EMPTY
    end
  end

  # Get

  # http://localhost:3000/api/v1/getTag?tag=0002,0000&id=1
  def get_tag
    tag = params[:tag]
    dicom_id = params[:id]

    resp = DicomFileService.get_tag(tag, dicom_id)
    if resp.present?
      render json: {value: resp}
    else
      render EMPTY
    end
  end

  # http://localhost:3000/api/v1/getPngUrl?id=13
  def get_png_url
    dicom_id = params[:id]
    resp = DicomFileService.get_png_url(dicom_id)
    if !resp.present?
      render json: {png_url: resp}
    else
      render json: EMPTY
    end
  end
end