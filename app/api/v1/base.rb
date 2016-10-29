require 'grape-swagger'

module V1
  class Base < Grape::API
    version 'v1', using: :path
    prefix :api
    format :json
    # mount V1::ActiveDefenses
    add_swagger_documentation(
      hide_documentation_path: true,
      mount_path: '/swagger_doc',
      hide_format: true
    )
  end
end
