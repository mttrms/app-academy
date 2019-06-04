# Breaking Confusing Methods Into Parts

```
exp(b, n) = b * exp(b, n - 1)
```

```
exponent(base, power) = base * exponent(base, power - 1)
```

```
smaller_exponent = power - 1
exponent(base, power) = base * exponent(base, smaller_exponent)
```

```
smaller_exponent = power - 1
base_to_the_smaller_exponent = exponent(base, smaller_exponent)

exponent(base, power) = base * base_to_the_smaller_exponent
```

## Two important takeaways
1. We named the variables as descriptively as possible.
2. We broke complicated lines down into parts.

```
def return_number(a)
  ((a / 2)**2) * (65 - (a / 2))
end
```

Rewritten....

```
def calculate_childs_retirement_balance(age)
  childs_age = age / 2
  childs_current_bank_balance = childs_age ** 2
  childs_years_until_retirement = (65 - (age / 2))

  childs_current_bank_balance * childs_years_until_retirement
end
```