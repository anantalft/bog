require 'rails_helper'
require 'pry'

RSpec.describe Trie, type: :lib do

  let(:trie)  {Trie.new}

  describe "#build" do
    it "returns trie data structure from given array of strings" do
      #trie = Trie.new
      trie.build(['ant','ans','art'])
      expect(trie).to eq({"a"=>{"n"=>{"t"=>{}, "s"=>{}}, "r"=>{"t"=>{}}}})
    end
  end

  describe "#build_dictionary_from" do
    it "build_dictionary_from" do
      # File.stub(:open)
      #
      # expect(File).to receive(:open).with('file_path', 'Hello World')

      #file = double()
      file_path = double('file_path')

      # allow(File).to receive(:open).with(file_path).and_return(['ant','ans','art'])
      # expect(trie.build_dictionary_from(file_path)).to eq({"a"=>{"n"=>{"t"=>{}, "s"=>{}}, "r"=>{"t"=>{}}}})
    end
  end
end



