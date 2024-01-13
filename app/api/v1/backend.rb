# Top level module
module V1
  # Backend API
  class Backend < Grape::API
    resource :health do
      desc 'get status of backend health'
      get '/' do
        result = { status: 200 }

        present result
      end
    end
  end
end