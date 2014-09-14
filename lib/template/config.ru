require 'sinatra/base'
require 'yaml'
require 'buttless'
@home_dir = File.dirname(__FILE__)


# Create new Sinatra controller
controller = Sinatra.new do
  enable :logging
  set :root, './api-doc/'
  configure do
    set :views, ''
  end

end

# Loop through our API database
# setting up the sinatra app dynamically
map('/') do
  run Sinatra.new(controller) {

    root = "#{File.dirname(__FILE__)}"


    controller.set :root, "#{root}/api-doc"
    controller.set :public_folder, "#{root}/api-doc"

    get('/docs') {
      buttless = Buttless.new(root, "#{request.scheme}://#{request.host}#{request.port != 80 ? ":#{request.port }": 0}")
      html = buttless.generate_html
      html
    }

    @db = YAML::load(File.open("./database.yaml"))
    @db.each do |resource|
      resource["methods"].each do |method|
        #next if method["path"] =~ /comfort_/
        puts "Configuring #{method["path"]}"

        # map the path of the API method


        # if it's a POST method
        if method["method"] == "POST"
          post(method["path"]) {
            content_type :json
            File.open("#{root}/json_examples/#{method["example_response"]}.json".downcase, 'r').read
          }
        else
          get(method["path"]) {
            content_type :json
            File.open("#{root}/json_examples/#{method['example_response']}.json".downcase, 'r').read
          }
        end
      end
    end
  }
end




