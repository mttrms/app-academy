# Helpful byebug commands

* `list=` to re-display where you are paused in the source code
* `display some_variable` to print the value of a variable each time it pauses in code
* `where` to see "where" something was called

```
[3, 12] in building.rb
    3:     @temperature = 70
    4:   end
    5:
    6:   def set_thermostat(temp)
    7:     debugger if temp > 90
=>  8:     @temperature = temp
    9:   end
   10: end
   11:
   12: house = Building.new
(byebug) where

--> #0  Building.set_thermostat(temp#Integer) at building.rb:8
    #1  <main> at building.rb:21
(byebug)
```

We entered the debugger because we met the condition temp > 90. Then `where` shows us the call stack. 