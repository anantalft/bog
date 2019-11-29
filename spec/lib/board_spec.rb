require 'rails_helper'
RSpec.describe Board, type: :lib do

  subject { Board.new }

  describe "attribute accessors" do
    it "should have board_array" do
      subject.board_array
      expect(subject.name).to eq('Alice')
    end
  end

  describe "#dictionary_trie" do
    it "returns trie data structure from given array of strings" do

    end
  end
end



