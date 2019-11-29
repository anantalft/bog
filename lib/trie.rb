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

  def build_dictionary_from(file_path)
    words = []
    File.open(file_path) do |file|
      file.each do |line|
        words<<line.strip
      end
    end

    self.build(words)

    return self
  end
end
