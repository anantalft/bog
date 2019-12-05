
json.valid_words do
  json.array! @boggle.v_words
end
json.board do
  json.array! @boggle.board.board
end
