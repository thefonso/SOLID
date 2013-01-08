class Rectangle
  attr_accessor :height, :width
  
  def area
    @height * @width
  end   
end


class Square < Rectangle
  def height=(height)
    @side = height
  end

  def width=(width)
    @side = width
  end

  def area
    @side * @side
  end
end

class RectangleInterface
  # ???
end

class AbstractInterface
  # ???
end

class ProgramInterface
  # ???
end

class Program
  def initialize(name, height, width)
    if name == :square
      @shape = Square.new
      @shape.height = height
    else
      @shape = Rectangle.new
      @shape.height = height
      @shape.width = width
    end
  end

  def area
    @shape.area
  end
end

program1 = Program.new(:square, 2, 4)
puts program1.area
program2 = Program.new(:rectangle, 4, 5)
puts program2.area
# >> 4
# >> 20
