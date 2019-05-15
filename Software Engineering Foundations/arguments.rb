# Default arguments

def repeat(str, n=10)
  p str * n
end

repeat("hi")

# Hashes as arguments.. braces not necessary

def print_h(hash)
  p hash
end

print_h({"name" => "matt", "age" => 100})
print_h("name" => "matt", "age" => 100)