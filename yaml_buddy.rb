require 'yaml'
# Module that can be included (mixin) to take and output Yaml data
module YamlBuddy
  def take_yaml(yaml)
    @data = ''
    file_yaml = YAML.safe_load(yaml)
    result = ''
    result += get_key(file_yaml, result)
    result = del_get_end(result)
    file_yaml.each do |keys|
      keys.each_value { |value| result += value.to_s + "\t" }
      result = del_get_end(result)
    end
    @data = result
  end

  def del_get_end(result)
    result = result.chomp("\t")
    result + "\n"
  end

  def get_key(file_yaml, result)
    file_yaml[0].each_key do |titles, _values|
      empty_str = ''
      empty_str += titles.to_s + "\t"
      result += empty_str
    end
    result
  end

  def to_yaml
    @data.to_yaml
  end
end
