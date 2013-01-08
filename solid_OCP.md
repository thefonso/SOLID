SOLID Principle 2 

OCP - Open Closed Principle - Entities should be open for extension, but closed for modification...[think Google Chrome]

Analogy:
In Firefox or the Google Chrome browser you are able to apply extensions to the browser via plugins. 
The browser itself is "closed to modification but open to extension". Your Classes and Methods should be the same way.
Extending their behavior should not result in changes to the source code.

So say we have a client who wants a program that prints "Welcome" does some stuff and then prints "Thanks for coming"

So we build this program...The code for this looks like so...

	def main 
	  puts "Welcome"
	  getMove
	  doCoolStuff
	  puts "Thanks for coming"
	end

**Violation of OCP**

But now our client wants to add the ability to print in multiple lanquages. Right now our code violates the OCP. 
In that it's not open for extension.



**A Solution**

So we abstract our main so we can plugin any lanquage we want.

	class SomeProgram
	  attr_accessor 'lanquage'
	  def initialize(language)
	    @language = language
	  end
	  def main
	  	p @lanquage.welcome
	    # getMove
	    # doCoolStuff
	  	p @lanquage.thanks
	  end
	end


	class English
		def welcome
			"Welcome"
		end
	  def thanks
	    "Thanks"
	  end
	end
  
	class Espanol
		def welcome
			"Hola"
		end
	  def thanks
	    "gracia"
	  end
	end 

	SomeProgram.new Espanol.new
	


Abstraction is key:


Conclusion:

Conformance to the OCP brings you the greatest benefits of Object Oriented Technology...

1. Flexability
2. Reusability 
3. Maintainability 

Yet conformance is not achieved simply by using an object-oriented language, like Ruby, it is acheived with diligent effort on the part of 
the developer to apply abstraction only to the parts of the code that exhibit frequent change.