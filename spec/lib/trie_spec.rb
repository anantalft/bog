require 'rails_helper'

RSpec.describe Trie, type: :lib do

  describe "#build" do
    it "returns trie data structure from given array of strings" do
      trie = Trie.new
      trie.build(['ant','ans','art'])
      expect(trie).to eq({"a"=>{"n"=>{"t"=>{}, "s"=>{}}, "r"=>{"t"=>{}}}})
    end
  end
end



