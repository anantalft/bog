require 'rails_helper'
require 'pry'
RSpec.describe Boggle, type: :lib do

  # subject { Board.new('AERTSDEFRTHYUJKM') }
  #let(:boggle) { described_class.new }
  let(:boggle) { double('boggle') }

  describe "#solve" do
    it "solve" do

      # b_string = double('ABCDECOHBOKLBNOE')
      # file_path = double('file_path')
      #
      #
      #
      # board = double(b_string)
      # trie = double()
      # valid_words = double()
      #
      #
      #
      # allow(board).to receive(:new).with(b_string)
      # allow(board).to receive(:build).and_return([["A", "B", "C", "D"], ["E", "C", "O", "H"], ["B", "O", "K", "L"], ["B", "N", "O", "E"]])
      #
      #
      #
      # allow(File).to receive(:open).with(file_path).and_yield(['bob','aecok','cod'])
      # allow(trie). to receive(:build_dictionary_from).with(file_path).and_return({"b"=>{"o"=>{"b"=>{}}}, "a"=>{"e"=>{"c"=>{"o"=>{"k"=>{}}}}}, "c"=>{"o"=>{"d"=>{}}}})
      #
      # allow(boggle).to receive(:new).with(b_string, file_path)
      # allow(boggle).to receive(:valid_words).and_return([])
      # #boggle.solve
      # expect(boggle.valid_words).to eq(['bob','aecok','cod'])


    end

  end

end



