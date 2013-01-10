##SOLID Principle 4

**ISP - Interface Segregation Principle: CLIENTS SHOULD NOT BE FORCED TO DEPEND ON METHODS THAT THEY DO NOT USE.**


So...last time in our saga of the SOLID principles we talked about The Liskov Substitution Principle and we ended with this situation...

##The Problem:
Our client "SomeProgram" has too much knowledge, he must know about all the shapes in order to work...


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

	
...And this caused a violation of the LSP

diagram LSP_02

![Alt text](http://farm9.staticflickr.com/8333/8366077206_be691dbba4_z.jpg)

LSP violation


##The Solution:

We must create something that segregates "SomeProgram" from the Rectangle and Square shape Classes. 
We can create an interface that stands between our client "SomeProgram" and our shapes "Square" and "Rectangle".

So the first thing we do is isolate Square and Rectangle from one another just for simplicity sake. 
Each shape class is now totally isolated.

 
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
	
We now create a new class we will call "TwoDimensionalShape" that will receive the name of a shape(Rectangle, Square, etc) and any number of 
options (hight, width, radius, etc.) and give us the calculated area value from that specific shape object.

	class TwoDimensionalShape
	  def initialize(name, options={})
	    @s = Object.const_get(name.capitalize).new(options)
	  end
  
	  def area
	    @s.area
	  end
	end	


So now we have this (Red)

diagram ISP_03

![Alt text](http://farm9.staticflickr.com/8494/8365004953_49f6bbb4e3_z.jpg)


And we now refactor (rewrite) "SomeProgram"...


From this...

	class SomeProgram
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

To this...


	class SomeProgram 
	  def initialize(name, options={})
	    @shape = TwoDimensionalShape.new(name, options)
	  end
	  
	  def area
	    @shape.area
	  end
	end

	


And now our diagram looks like this

diagram ISP_05

![Alt text](http://farm9.staticflickr.com/8049/8365004943_61108eec6d_z.jpg)

Now we have resolved our LSP violation by successfully segregating "SomeProgram" from "Rectangle" and "Square".
And our client "SomeProgram" can get the area of any shape without having to modify it's internal source code to do so.

##Conclusion:

You can isolate concerns between your client "SomeProgram" and the Classes it needs to get information with via
an interface-like class. Now we can get area objects with impunity without ever having to change the internal 
source code of our client to do so...

	square_area = SomeProgram.new "square", side: 4
	rectangle_area = SomeProgram.new "rectangle", width: 20, height: 4

	square_area.area # => 16
	rectangle_area.area # => 80

and if we want even more shapes, say a circle, we can just add a new Circle class

	class Circle
	  attr_accessor :radius
	  def initialize(options)
	    self.radius = options.fetch(:radius)
	  end
  
	  def area
	    2 * Math.pi * self.radius
	  end
	end


and our client "SomeProgram" can now generate a circle's area as well. 
	
	square_area = SomeProgram.new "circle", radius: 9
	square_area.area # =>
