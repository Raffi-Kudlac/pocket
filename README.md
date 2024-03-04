# Dear PocketHealth

Welcome to my solution for your take home assignment. In general in contains an API consisting of three endpoints. Currently the logic in the services funtions off the assumption that the dicom and png files are stored locally. Of course in the real world this would bee external urls to these files.

param - url. The url or 'file path' of the dicom file to be 'uploaded'\
return - id. If sucessful, returns an ID that can be used to retrieve information about the dicom file
> upload(dicom_file_url)

@param - tag. The full tag of a property in the form "XXXX,XXXX"\
@param - id. The ID of the dicom file to which the tag refers\
@return - value. The value of the tag if it exists
> get_tag(tag, dicom_id)

param - id. The ID of the dicom file\
return - url. The url or 'file path' of the png file that was created when the dicom file was 'uploaded'
> get_png_url(dicom_id)


# Tech stack
- Ruby on Rails
- SQLite for the SQL database
- I used a Ruby [DICOM gem](https://github.com/dicom/ruby-dicom/tree/e736255966b35dd4fb46008dca53da7a2353a612) to help me process the dicom file

# Important Files
Ruby on Rails generates a lot of files for the developer. Below I have highlighted the main files where my logic lives and some others that I think you will be interested in.

- [PNG folder](https://github.com/Raffi-Kudlac/pocket/tree/main/app/assets/created_png_files). Where the created PN G files are stored

- [Services](https://github.com/Raffi-Kudlac/pocket/tree/main/app/services). Where my main two services live


- [Dicom File DB Model](https://github.com/Raffi-Kudlac/pocket/blob/main/app/models/dicom_file.rb)

- [Tag DB Model](https://github.com/Raffi-Kudlac/pocket/blob/main/app/models/tag.rb)

- [Routes](https://github.com/Raffi-Kudlac/pocket/blob/main/config/routes.rb). Where the API endpoints are defined

- [API Entry Point](https://github.com/Raffi-Kudlac/pocket/blob/main/app/controllers/api/v1/main_controller.rb)

