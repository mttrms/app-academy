def exp_1(base, exponent)
  return 1 if exponent == 0
  return base if exponent ==  1
  base * exp_1(base, exponent - 1)
end

p exp_1(13, 6)

def exp_2(base, exponent)
  return 1 if exponent == 0
  return base if exponent ==  1

  if exponent % 2 == 0
    exp_2(base, exponent / 2) ** 2
  else
    base * (exp_2(base, (exponent - 1) / 2) ** 2)
  end

end

p exp_2(2, 5)
