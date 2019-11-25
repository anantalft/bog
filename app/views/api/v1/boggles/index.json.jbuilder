json.valid_words do
  json.array! @bo.valid_words
end
json.board do
  json.array! @bo.print_board
end
