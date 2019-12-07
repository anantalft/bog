[![CircleCI](https://circleci.com/gh/anantalft/bog/tree/master.svg?style=svg)](https://circleci.com/gh/anantalft/bog/tree/master)

<a href="https://codeclimate.com/github/anantalft/bog/maintainability"><img src="https://api.codeclimate.com/v1/badges/6dc9bb6b41f96cbbc28c/maintainability" /></a>

[![Test Coverage](https://api.codeclimate.com/v1/badges/6dc9bb6b41f96cbbc28c/test_coverage)](https://codeclimate.com/github/anantalft/bog/test_coverage)

# Boggle

Demo url: https://ananta-boggle.herokuapp.com/

* When game starts, new 4x4 board is generated. 
* User can type the words which they think they found.
* System does validation and adds valid words into a list. 
* Systems keeps track of scores, the score is total number of characters in the word. –If word is invalid an error is displayed. 
* When timer runs out user can no longer enter new words, but should see results. 

To solve the boggle board problem. I have created three lib classes Trie, Board and Boggle. Boggle class takes trie and board object to solve.

###Trie class
To build a trie I took a english dictionary from the internet.

Link to [dictionary](https://github.com/anantalft/bog/blob/master/files/letterpress_en_dictionary.txt)

For all the words in the dictionary I have build a trie data structure. Reference [stackoverflow]( https://stackoverflow.com/questions/9042426/explanation-of-ruby-code-for-building-trie-data-structures)
Inside the lib folder is a Trie class that contains a function to build a data structure. Building trie logic starts with an empty hash (h={}) and then traverse through each character in the first word of the array. If the hash contains that letter, the position is updated to that hash value h=h[char]. If a character is not in the hash, that char is added to the hash with an empty hash. For example
  h = {char=>{}}
  
For example:
```
trie = Trie.new
trie.build(['art','arc', 'and'])
```
will give the trie tree as follows
```
{"a"=>{"r"=>{"t"=>{}, "c"=>{}}, "n"=>{"d"=>{}}}}

```
From external file the function call would be as below:
```
trie = Trie.new
trie.build_dictionary_from(file_path)
```
###Board class to generate a board
```
board = Board.new
```
Board will generate a 4* 4 character matrix. Refer to the code for detail logic.

###Boogle class to solve the boggle
Boggle takes trie and board as the two params. I used depth first search to traverse through the trie data structure. Solve function solve the board and returns all the generated valid words
```
boggle = Boggle.new(board,trie)
valid_words = boggle.solve
```
###Technology Used

* Ruby version 2.4.1
* Rails version 5.2.3
* react_on_rails gem for building and rendering react component
* Rspec for unit testing
* Heroku for deployment

###Rspec results
