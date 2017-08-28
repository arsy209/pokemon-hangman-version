class Word

  def initialize(word)
    @word = word
    @letters = word.split("").map do |letter| {:letter =>letter, :hidden => true}
  end

  def name
    @word
  end

  def found?
    @letters.all? do |h| h.[:hidden] == false
    end
  end

  def try(letter)
    found = false
    @letters.each do |h|
      if h[:letter] == (letter)
        hash[:hidden] = false
        found = true
      end
    end
    found
  end

  def render
    output = []
    @letters.each do |h|
      if h[:hidden] ==false
        output.push(hash[:letter])
      else
        output.push("_")
      end
      return output.join
    end
end
