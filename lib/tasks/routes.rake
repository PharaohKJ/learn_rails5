namespace :api do
  desc 'API Routes'
  task routes: :environment do
    ApplicationApi.routes.each do |api|
      method = api.request_method.ljust(10)
      # path = api.route_path.gsub(':version', api.route_version)
      puts "     #{method} #{api.path}"
    end
  end
end
