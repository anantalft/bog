require 'rails_helper'
require 'pry'

RSpec.describe Trie, type: :lib do

  let(:trie)  {Trie.new}

  describe "#build" do
    it "returns trie data structure from given array of strings" do
      trie.build(['ant','ans','art'])
      expect(trie).to eq({"a"=>{"n"=>{"t"=>{}, "s"=>{}}, "r"=>{"t"=>{}}}})
    end
  end

  describe "#build_dictionary_from file" do
    it "build trie dictionary from file text" do
      file_path = double('file_path')
      allow(File).to receive(:open).with(file_path).and_yield(['ant','ans','art'])
      expect(trie.build_dictionary_from(file_path)).to eq({"a"=>{"n"=>{"t"=>{}, "s"=>{}}, "r"=>{"t"=>{}}}})
    end
  end
end



