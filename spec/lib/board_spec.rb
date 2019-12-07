require 'rails_helper'
require 'pry'
RSpec.describe Board, type: :lib do

  subject { Board.new }

  describe "#board" do
    it "should generate a board" do
      b_string = subject.b_string
      board = b_string.join.chars.each_slice(4).map {|row| row}
      expect(subject.board).to eq(board)
    end
  end

  describe "#get_neighbors" do
    it "should give 3 neighbours when the data is from index row:0,col:0" do
      expect(subject.get_neighbors(0,0).count).to eq(3)
    end

    it "should give 5 neighbours when the data is from index row:1,col:0" do
      expect(subject.get_neighbors(1,0).count).to eq(5)
    end

    it "should give 8 neighbours when the data is from index row:1,col:1" do
      expect(subject.get_neighbors(1,1).count).to eq(8)
    end
  end

  # describe "#inbounds??" do
  #   it "returns true when row and column is zero" do
  #     expect(subject.inbounds?(0,0)).to be true
  #   end
  #
  #   it "returns false when row or column is less than zero" do
  #     expect(subject.inbounds?(-1,0)).to be false
  #   end
  # end

end



