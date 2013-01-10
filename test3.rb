class SomeProgram
  attr_accessor 'language'
  def initialize(language)
    @language = language
  end
  def main
    p @language.welcome
    p @language.thanks
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

class Spanish
  def welcome
    "Hola"
  end
  def thanks
    "gracia"
  end
end 

speak1 = SomeProgram.new Spanish.new
speak1.main
speak2 = SomeProgram.new English.new
speak2.main

# >> "Hola"
# >> "gracia"
# >> "Welcome"
# >> "Thanks"
