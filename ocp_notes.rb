# 1. OCP
# original - not open but closed
def main 
  puts "Welcome"
  puts "Thanks for coming"
end
# 
# 
# 
# But now the client wants to add multiple lanquages.   
# 
# So we abstract our main so we can plugin any lanquage we want
def main (welcome_statement, thanks_statement)
  p welcome_statement
  p thanks_statement
end


# But know let's do this in away that alows for any number of future languages


class SomeProgram
  attr_accessor 'lanquage'
  def initialize(language)
    @language = language
  end
  def main
  	p @lanquage.welcome
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

SomeProgram.new Espanol.new # => #<SomeProgram:0x007fe13a08a4d0 @language=#<Espanol:0x007fe13a08a4f8>>


# note: strategy pattern, template methods 
