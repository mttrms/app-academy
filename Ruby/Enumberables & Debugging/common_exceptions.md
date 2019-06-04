# Common Exceptions

## NameError
Thrown when you try to use a vaiable or method that hasn't been defined.

```
class NumbersClass
  def answer_number
    42
  end

  def loneliest_number
    1
  end

  def numbers
    [favorite_nmber, loneliest_number]
  end
end
```

### Uninitialized Constant
"Uninitialized constant" means that Ruby is trying to find a class (or other constant), but didn't find it. This could be because of a class name typo, or often because we forgot to `require` the Ruby file that loads the class.

### NoMethodError
This is similar to NameError; in fact it's a subclass. This is thrown when it's clear the user wanted to call a method (didn't try to look up a variable) that doesn't exist:

## ArgumentError: wrong number of arguments
If we don't give a method the right number of arguments, we will get an exception thrown at us

```
[12] pry(main)> [1, 2, 3].shuffle("unwanted argument")
ArgumentError: wrong number of arguments (1 for 0)
        from: (pry):9:in `shuffle'
```

## TypeError
A TypeError may be thrown if you pass the wrong type of thing to a method. For instance, numbers can only add other numbers:

## LoadError
There are two very common causes. Sometimes you are trying to load a file that is provided by a gem, but you haven't installed the gem yet.

Another common cause is that you are trying to load another source file in your project, but you forgot the initial './'. Relative includes are used to include files that are inside your project, you write them like this:

## SyntaxError
Writing ungrammatical Ruby code will net you a SyntaxError. This tells you that Ruby didn't understand your code.

There are lots of sources of syntax errors. The most common are forgetting to close quotes, parentheses, or do-end blocks.

