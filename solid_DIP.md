##SOLID Principle 5

**DIP - Dependency Inversion Principle: High-level policy should not depend on low-level detail. Low-level detail should depend on high-level policy.**

So here we left off our some program class...it has a problem, can you see it?

```
class SomeProgram 
  def initialize(name, options={})
    @shape = TwoDimensionalShape.new(name, options)
  end

  def area
    @shape.area
  end
end
```

That's right, it depends on knowing the name another class...TwoDimensionalShape

So what happens when in the course of development, thosands of lines later when we discover we need to rename that long named class because it no longer suites us. Hint, it is already getting worn, remeber the last time we used SomeProgram we sent it a circle? Well what if we want to send it sphere instead? 

The name could be refactored simple here but 5000 lines of code later maybe not so. Yes your super powerful IDE will easily handle it via search and replace BUT there are other more pressing reasons why this is bad. IT is more about sending messages instead of data. And making things as decoupled as possible.

```
class SomeProgram 
  def initialize(shape)
    @shape = shape
  end

  def area
    @shape.area
  end
end

circle_area = SomeProgram.new (TwoDimensionalShape.new("circle", radius: 9))
circle_area.area # => 254.4690087
```

