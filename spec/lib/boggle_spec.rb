require 'rails_helper'
require 'pry'
RSpec.describe Boggle, type: :lib do

  # subject { Board.new('AERTSDEFRTHYUJKM') }
  #let(:boogle) {described_class.new}
  let(:boggle) { described_class.new("ABCDECOHBOKLBNOE",'') }
  describe "#solve" do
    it "solve" do
      # board = double()
      # trie = double()
      #
      # #b_string = ABCDECOHBOKLBNOE
      # allow(board).to receive(:build). and_return([["A", "B", "C", "D"], ["E", "C", "O", "H"], ["B", "O", "K", "L"], ["B", "N", "O", "E"]])
      # allow(trie).to receive(:build_dictionary_from). and_return({"b"=>{"o"=>{"b"=>{}}}, "c"=>{"o"=>{"d"=>{}}}})
      #
      # binding.pry
      # boggle.solve
      # expect(boggle.valid_words).to eq(['bob','cod'])
    end

  end

end



