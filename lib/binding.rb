class RyBinding

  def initialize(content)
    content.instance_variables.each do |variable_name|
      variable_name = "#{variable_name.to_s}"
      value = content.instance_variable_get(variable_name)
      instance_variable_set(variable_name, value)
      self.class.instance_eval { attr_reader variable_name.gsub('@', '') }
    end
  end

  def get_binding
    binding
  end

end