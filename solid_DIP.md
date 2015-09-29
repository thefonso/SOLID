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

Dependency Injection complete...here's the whole thing now....go play with it in youre editor

```
# SOLID

class Rectangle
  attr_accessor :height, :width
  def initialize(options)
    self.height = options.fetch(:height)
    self.width  = options.fetch(:width)
  end

  def area
    @height * @width
  end
end


class Square
  attr_accessor :side
  def initialize(options)
    @side = options.fetch(:side)
  end

  def area
    @side * @side
  end
end

class Circle
  attr_accessor :radius
  PI = 3.1415927
  def initialize(options)
    self.radius = options.fetch(:radius)
  end

  def area
    PI * self.radius ** 2
  end
end

class TwoDimensionalShape
  def initialize(name, options={})
    @s = Object.const_get(name.capitalize).new(options)
  end

  def area
    @s.area
  end
end 

# class SomeProgram
#   def initialize(name, options={})
#     @shape = TwoDimensionalShape.new(name, options)
#   end
#
#   def area
#     @shape.area
#   end
# end

class SomeProgram 
  def initialize(shape)
    @shape = shape
  end

  def area
    @shape.area
  end
end


# square_area = SomeProgram.new "square", side: 4
# rectangle_area = SomeProgram.new "rectangle", width: 20, height: 4
#
# square_area.area # => 16
# rectangle_area.area # => 80

# circle_area = SomeProgram.new "circle", radius: 9
# circle_area.area # => 254.4690087

circle_area = SomeProgram.new (TwoDimensionalShape.new("circle", radius: 9))
circle_area.area # => 254.4690087

```
