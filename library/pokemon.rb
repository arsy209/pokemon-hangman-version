class Pokemon

	def initialize(words)
    @words = words.map {|w| Word.new(w)}
    start_pokemon_game()
  end

  def start_pokemon_game
    @letters_guessed = []
    @current_word = @words.sample
    @total_guesses = 15
  end

  def total_guesses
    @total_guesses
  end

  def guess(letter)
    unless @letters_guessed.include?(letter)
      @current_word.try(letter)
      unless @current_word.try(letter)
        @guesses -= 1
      end
      @letters_guessed.push(letter)
  end

  def finished?
    if @current_word.found? || @total_guesses == 0
      return true
    else
      return false
    end
  end

  def finished_message
    if @current_word.found?
      puts "The current Pokemon was         #{@current_word.name}"
      return "You Have Won!!!!!"
    elsif @total_guesses == 0
      puts "The pokemon was #{@current_word.name}"
      return "Tough Luck, Your Lost!!!"
    else
      return ""
    end
  end

  def render
    return "The current pokemon is #{@current_word.render}\n You have #{total_guesses} left."
  end
end
end
