class Template
  
  def self.get_template(template_name)
    template_name += '.html.erb'
    File.expand_path("../../views/#{template_name}", __FILE__)
  end

end