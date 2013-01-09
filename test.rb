class Rectangle
  attr_accessor :height, :width

  def area
    @height * @width
  end
  
end
  
  
class Program
  def initialize(height, width)
      @shape = Rectangle.new
      @shape.height = height
      @shape.width = width
  end

  def area
    @shape.area
  end
end
  
  rect = Program.new 20, 10
  rect.area # => 200
