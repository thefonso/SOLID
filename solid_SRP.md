##SOLID Principle 1

**SRP - Single Responsibility Principle - Every class (and method) should be responsible for one thing and one thing only.**

A client wants you to create a small app that makes a pizza...

	class MakePizza
	  def make_pizza(number)
	  end
	end

So the client is happy. The app makes pizza and it is yummy.

So now He wants you to add more features into the app. He wants to deliver the pizza, track inventory, and send the customer a thank you letter.

	class MakePizza
	  def make_pizza(number)
	  end
	  
	  def track_inventory
	  end
	  
	  def customer_thankyou_letter
	  end
	  
	  def make_delivery
	  end
	end
	 

So now this single scope class contains methods that do not share the same scope as Class MakePizza. Our original class is now...

![Alt text](http://farm9.staticflickr.com/8369/8360263874_a49d47c22c.jpg)

We now have a fat class that does way more than it's intended original scope. And this is what violates the SRP.

So to resolve this, we seperate each of these methods into a class of their own with a single scope. 

	class MakePizza
	  def make_pizza(number)
	  end
	end
	
	class Inventoroy  	
      def track_inventory
      end
	end
	
	class Delivery
	  def make_delivery
	  end
	  
	  def customer_thankyou_letter
	  end
	end  
	
Thus creating skinny classes.

![Alt text](http://farm9.staticflickr.com/8492/8360264158_27b1113370.jpg)

Hopefully this simple example succesfully illustrates the idea behind the principle and that is, as your code grows your classes 
will have a tendincy to grow fat. Fat classes indicate that you may have more than one scope hiding inside your code. 
Look for this and seperate your classes out according to scope.
