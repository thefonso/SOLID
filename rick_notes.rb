# don't really need Shape class
class Shape
  def initialize(options)
  end
  
  def area
  end
end
 
class CircleShape
  attr_accessor :radius
  def initialize(options)
    self.radius = options.fetch(:radius)
  end
  
  def area
    2 * Math.pi * self.radius
  end
end
 
class RectangleShape
  attr_accessor :length, :width
  def initialize(options)
    self.length = options.fetch(:length)
    self.width  = options.fetch(:width)
  end
  
  def area
    @length * @width
  end
end
 
class TriangleShape
end
 
class PolygonShape
end
    

 
class ProgramShapeInterface
  attr_accessor :program, :shape
  def initialize(options)
    self.program = options.fetch(:program)
    self.shape   = options.fetch(:shape)
  end
  
  def some_method_justifying_the_interface
  end
end
 
class Program
  attr_accessor :area
end




------------------------
note this: 
interface
def abstract_interface(obj)
  obj.do_stuff
end
you pass the object to the method.