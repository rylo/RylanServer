class Storage
  def self.data
    @data ||= {}
  end
  
  def self.save(key, value)
    data[key] = value
  end
  
  def self.fetch(key)
    data[key]
  end
end