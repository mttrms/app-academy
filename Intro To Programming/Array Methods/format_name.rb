# Write a method format_name that takes in a name string and
# returns the name properly capitalized.

# def format_name(str)
#   names = str.split(" ")
#   formatted_name = []

#   names.each do |name|
#     capitalized_name = ""
#     name.each_char.with_index do |char, idx|
#       if idx == 0
#         capitalized_name += char.upcase
#       else
#         capitalized_name += char.downcase
#       end
#     end
#     formatted_name << capitalized_name
#   end
  
#   return formatted_name.join(" ")
# end

def format_name(str)
  names = str.split(" ")
  formatted_names = []

  names.each do |name|
    formatted_names << name[0].upcase + name[1..-1].downcase
  end

  return formatted_names.join(" ")
end


puts format_name("chase WILSON") # => "Chase Wilson"
puts format_name("brian CrAwFoRd scoTT") # => "Brian Crawford Scott"