json.valid_words do
  json.array! @boggle.valid_words
end
json.board do
  json.array! @boggle.board
end
