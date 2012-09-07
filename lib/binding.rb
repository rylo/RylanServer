class RyBinding

  def initialize(content)
    content.instance_variables.each do |variable|
      variable = "#{variable.to_s}"
      value = content.instance_variable_get(variable)
      instance_variable_set(variable, value)
      self.class.instance_eval { attr_reader variable.gsub('@', '') }
    end
  end

  def get_binding
    binding
  end

end