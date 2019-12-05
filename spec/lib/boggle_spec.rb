require 'rails_helper'
require 'pry'
RSpec.describe Boggle, type: :lib do

  describe "#solve" do

    it "#solve_and_return_v_words" do
      board = double()
      trie = {"b"=>{"o"=>{"b"=>{}}}, "a"=>{"e"=>{"c"=>{"o"=>{"k"=>{}}}}}, "c"=>{"o"=>{"d"=>{}}}}

      allow(board).to receive(:board).and_return([["A", "B", "C", "D"], ["E", "C", "O", "H"], ["B", "O", "K", "L"], ["B", "N", "O", "E"]])

      allow(board).to receive(:get_neighbors).with(0,0).and_return([[0, 1], [1, 0], [1, 1]])
      allow(board).to receive(:get_neighbors).with(0,1).and_return([[0, 0], [0, 2], [1, 0], [1, 1], [1, 2]])
      allow(board).to receive(:get_neighbors).with(0,2).and_return([[0, 1], [0, 3], [1, 1], [1, 2], [1, 3]])
      allow(board).to receive(:get_neighbors).with(0,3).and_return([[0, 2], [1, 2], [1, 3]])
      allow(board).to receive(:get_neighbors).with(1,0).and_return([[0, 0], [0, 1], [1, 1], [2, 0], [2, 1]])
      allow(board).to receive(:get_neighbors).with(1,1).and_return([[0, 0], [0, 1], [0, 2], [1, 0], [1, 2], [2, 0], [2, 1], [2, 2]])
      allow(board).to receive(:get_neighbors).with(1,2).and_return([[0, 1], [0, 2], [0, 3], [1, 1], [1, 3], [2, 1], [2, 2], [2, 3]])
      allow(board).to receive(:get_neighbors).with(1,3).and_return([[0, 2], [0, 3], [1, 2], [2, 2], [2, 3]])
      allow(board).to receive(:get_neighbors).with(2,0).and_return([[1, 0], [1, 1], [2, 1], [3, 0], [3, 1]])
      allow(board).to receive(:get_neighbors).with(2,1).and_return([[1, 0], [1, 1], [1, 2], [2, 0], [2, 2], [3, 0], [3, 1], [3, 2]])
      allow(board).to receive(:get_neighbors).with(2,2).and_return([[1, 1], [1, 2], [1, 3], [2, 1], [2, 3], [3, 1], [3, 2], [3, 3]])
      allow(board).to receive(:get_neighbors).with(2,3).and_return([[1, 2], [1, 3], [2, 2], [3, 2], [3, 3]])
      allow(board).to receive(:get_neighbors).with(3,0).and_return([[2, 0], [2, 1], [3, 1]])
      allow(board).to receive(:get_neighbors).with(3,1).and_return([[2, 0], [2, 1], [2, 2], [3, 0], [3, 2]])
      allow(board).to receive(:get_neighbors).with(3,2).and_return([[2, 1], [2, 2], [2, 3], [3, 1], [3, 3]])
      allow(board).to receive(:get_neighbors).with(3,3).and_return([[2, 2], [2, 3], [3, 2]])

      boggle = Boggle.new(board, trie)
      boggle.solve
      expect(boggle.v_words).to eq(["aecok", "cod", "bob"])

    end

  end

end



