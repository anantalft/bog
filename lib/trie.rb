#Ref:  https://stackoverflow.com/questions/9042426/explanation-of-ruby-code-for-building-trie-data-structures
class Trie < Hash
  def initialize
    # Ensure that this is not a special Hash by disallowing
    # initialization options.
    super
  end

  def build(arr_string)
    for word in arr_string
      word.chars.inject(self) do |h, char|
        h[char] ||= { }
      end
    end

  end
end
