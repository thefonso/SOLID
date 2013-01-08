#TODO - finish me

note this: 
interface
def abstract_interface(obj)
  obj.do_stuff
end
you pass the object to the method.


SOLID Principle 4

ISP - Interface Substitution Principle: DON'T DEPEND ON THINGS YOU DO NOT NEED

So what is the Interface Segregation Principle.

It's defined as follows...

ISP - "Don't depend on things you don't need" or "Clients should not be forced to depend on methods that they do not use."

So...last time in our saga of the SOLID principles we talked about The Liskov Substitution Principle and we ended with this situation...

We used an if statement...



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

	
And this caused a violation of the LSP

diagram LSP_02

![Alt text](diagram_LSP_02.png)

LSP violation

Program is directly asking if the returned value is an instance of Square. Our program requires direct knowledge of our derived subclass Square.
Subclass Square is thus not a proper substitute for Rectangle. And this is bad since it violate the LSP. So we need something that isolates 
SomeProgram from this knowledge of Square. We can use the Interface Segregation Principle to rescue this situation. So let's create our interfaces.

diagram ISP_01

![Alt text](diagram_ISP_02.png)

Time for an abstract interface...let's think about the steps needed for this.

1. Create an interface for the Rectangle class.
2. Create an interface for the Program class.

#fixme here - I need an interface sub done Ruby style (Ruby normaly doesn't have interfaces)
note: Ruby normaly doesn't have interfaces...why? 

Conclusion:
Watch out for fat classes. When one client forces a change on a fat class, all other classes are affected. Thus, clients should only have to 
depend on methods that they actually call. This can be achieved by breaking the interface of the fat class into many client-specific interfaces.
Each client-specific interface declares only those functions that its particular client, or client group, invoke.







