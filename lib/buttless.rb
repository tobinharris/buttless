require 'RedCarpet'
class Buttless
  def initialize(home_dir, host="http://127.0.0.1:9292")
    @home_dir = home_dir
    @host = host
  end

  def config
    reload_data()
    @config
  end

  def host
    @host
  end

  def generate_html(with_base=false)
     Dir.chdir(@home_dir)
     Dir.chdir('api-doc')
     @root_url = with_base ? "file://localhost#{Dir.pwd}/" : "./"
     reload_data()
     doc = Tilt.new("index.md.erb").render(self, :db=>@db, :helper=>Helper.new, :config=>@config)
     md = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(render_options={}), extensions={:tables=>true})
     #toc = Redcarpet::Markdown.new(Redcarpet::Render::HTML_TOC.new())
     @content = md.render(doc)

     @html = ERB.new(File.open('template.html.erb','r').read()).result(binding())
     @html = @html.gsub(/root_url/,@root_url)
   end

  def reload_data
    @config = YAML::load(File.open("#{@home_dir}/config.yaml"))
    @db = YAML::load(File.open("#{@home_dir}/database.yaml"))
  end


  def example(name)
     return "TODO" if name.nil?
     name = name.to_s
     File.open("#{@home_dir}/json_examples/#{name}.json".downcase,'r').read()
   end

end

class Helper
  def example_path(method, ip=nil)
    path = method["path"]
    params = []
    method["parameters"].each do |p|
      is_in_path = path.include?(":#{p['name']}")
      next if not is_in_path and (p["optional"] or p["type"]=="POST" or (p["type"].nil? and method["method"] == "POST"))
      if path.include?(":#{p['name']}")
        path = path.gsub(":#{p['name']}", p["example"].to_s)
        next
      else
        params << "#{p["name"]}=#{p["example"]}"
      end

    end unless method["parameters"].nil?

    api_call = "#{path}?#{params.join('&')}"
    #puts "**** WARNING **** \n Method length is #{api_call.length}, which is greater than 19 so won't work on some embedded devices: #{api_call}" if "#{path}?#{params.join('&')}".length > 19
    "#{ip}#{api_call}"
  end

  def example_curl(method, ip="http://0.0.0.0:3000", no=3)
    unparsed_path = method["path"]
    puts unparsed_path
    path = example_path(method, ip)
    i = 0
    params = []
    method["parameters"].select{|p|p["type"]=="POST" || (p["type"].nil? && method["method"]=="POST")}.each do |p|
      is_in_path = unparsed_path.include?(":#{p['name']}")
      puts ":#{p['name']} in path #{unparsed_path}? #{is_in_path}"
      break unless (i < no or p["optional"] == false)
      i=i+1 unless p["optional"] == false
      if ! is_in_path
        params << "#{p["name"]}=#{p["example"]}"
      else
        #path.gsub!(":#{p['name']}", p["example"].to_s)
      end
    end if method["parameters"]
    data = nil
    unless params.empty?
      data = "--data \"#{params.join(" \\ \n&")} \" "
    end
    "curl -v #{data.nil? ? '' : "\\\n #{data}"}\\\n#{path}".chomp('?')
  end
end