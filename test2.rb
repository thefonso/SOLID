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

class Square
  attr_accessor :side
  def initialize(options)
    @side = options.fetch(:side)
  end
  
  def area
    @side * @side
  end
end

class ProgramShapeInterface
  def initialize(name, options={})
    @s = Object.const_get(name.capitalize).new(options)
  end
  
  def area
    @s.area
  end
end

class SomeProgram 
  def initialize(name, options={})
    @shape = ProgramShapeInterface.new(name, options)
  end
	  
  def area
    @shape.area
  end
end
	
square_area = SomeProgram.new "square", side: 4
rectangle_area = SomeProgram.new "rectangle", width: 20, height: 4
circel_area = SomeProgram.new "circle", radius: 9
square_area.area # => 16
rectangle_area.area # => 80
circel_area.area # => 254.4690087
