

# What I want to do is...send 'Program' a width and / or height value
# and receive the calculated area for a shape depending on the number of values sent in.
# i.e. both width and height yeilds a rectangle... 
# If only one value for either width or height are sent to Program... 
# then the area returned is for a square.

class AbstractInterface
  # How to say ...if number of values received is greater than 1 (indicating both width and height are received)
  # instantiate requested Rectangle else instantiate Square and pass value(s) to object
end


class Rectangle < Program

  def area(height,width)
    a = height * width
    p 'rectangle area is ' + a.to_s
  end
end


class Square < Rectangle
  attr_accessor :side
		
	#duck typing with Rectangle
		
	def height=(height) @side = height  end 
	def width=(width) 	@side = width 	end
	def width()         @side			      end
	def height()		    @side			      end 
    
  def area(side)
    a = @side * @side
    p 'square area is ' + a.to_s
  end
end

