require 'sinatra/base'

@home_dir = File.dirname(__FILE__) + '/../'



# Create new Sinatra controller
controller = Sinatra.new do
  enable :logging  
  set :root, '../api-doc/'
  configure do
    set :views, ''
  end
  
end

# Loop through our API database
# setting up the sinatra app dynamically
map('/') do 
  run Sinatra.new(controller){              
  @db = YAML::load( File.open( "../database.yaml" ) )  
  @db.each do |resource|    
    resource["methods"].each do |method|
      #next if method["path"] =~ /comfort_/
      puts "Configuring #{method["path"]}"
      
      # map the path of the API method    
      
      
        # if it's a POST method
        if method["method"] == "POST"                     
          post(method["path"]){ 
            content_type :json
            File.open("../json_examples/#{method["example_response"]}.json".downcase,'r').read 
          }
        else
          get(method["path"]){ 
            content_type :json
            File.open("../json_examples/#{method['example_response']}.json".downcase,'r').read 
            }
        end      
    end
  end
  }
end


