require 'grape-swagger'

# Root API class
class RootAPI < Grape::API
  format :json
  prefix :api

  helpers do
    def permitted_params
      @permitted_params ||= declared(params, included: false)
    end
  end

  mount ::V1::API

  add_swagger_documentation \
    host: ENV.fetch('SWAGGER_HOST'),
    doc_version: '0.0.1',
    base_path: '',
    mount_path: '/v1/doc',
    add_base_path: true,
    add_version: true,
    info: {
      title: 'Weather API',
      contact_url: 'https://localhost:3000'
    },
    array_use_braces: true
end
