# 'abcdab987612' => 'a-dab9-612'

puts 'abcdab987612'.gsub(/(bc|87)/, "-")

# Wrap the long lines in the given text to the given length. Example:
#     'To be or not to be that is the question', 5 =>
#     `To be
#   or
#   not
#   to be
#   that
#   is
#   the
#   quest
#   ion`

string = ""
n = 5
"To be or not to be that is the question".split(/\b/).each_slice(n) { |*a| a[0].each do |sub_element|
  if (string.split(/\n/).length == 0 && sub_element.length <= n) || (string.split(/\n/).last.length + sub_element.length) <= n
    string << sub_element
  elsif sub_element.length > n
    sub_element.scan(/.{1,#{n}}/).each { |part_word| string << ("\n" + part_word) }
  else
    string << ("\n" + sub_element)
  end
end
}

puts "#" * 30
puts string.split(/\n/).map { |element| element.strip }.join("\n")
