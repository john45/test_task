require 'yaml'

result_hash = {}
simple_yaml = YAML.load_file(ARGV[0])
simple_yaml.each do |key, value|
  array_of_keys = key.split(".")
  array_of_keys.inject("") do |memo, key|
    if result_hash.count.zero?
      result_hash[key] = {}
      memo << "['#{key}']"
    else
      new_hash = eval("result_hash" + memo)
      if new_hash[key]
        memo << "['#{key}']"
      else
        new_hash[key] = if key.equal?(array_of_keys.last)
                               value
                             else
                               memo << "['#{key}']"
                               {}
                             end
      end
    end
    memo
  end
end

final_string_to_record = result_hash.to_yaml[4..]

open("translations.yml", "w+") do |f|
  f << final_string_to_record
end

