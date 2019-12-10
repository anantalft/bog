[![CircleCI](https://circleci.com/gh/anantalft/bog/tree/master.svg?style=svg)](https://circleci.com/gh/anantalft/bog/tree/master)
<a href="https://codeclimate.com/github/anantalft/bog/maintainability"><img src="https://api.codeclimate.com/v1/badges/6dc9bb6b41f96cbbc28c/maintainability" /></a>
[![Test Coverage](https://api.codeclimate.com/v1/badges/6dc9bb6b41f96cbbc28c/test_coverage)](https://codeclimate.com/github/anantalft/bog/test_coverage)

# Boggle

Demo url: https://ananta-boggle.herokuapp.com/

* Game starts with generated new 4x4 board matrix of words. 
* Player can type the words which they think they found.
* System does validation and adds valid words into a list of valid inputs. 
* Systems keeps track of scores, the score is total number of characters in the word. If word is invalid an error is displayed. 
* When timer runs out user can no longer enter new words, but sees final score.
* Player can see all the valid words by clicking on "See all valid words". 


### Code structure
#### React Componenents
```app/javascript/bundles/boggle/components```

 This file path contains the list of components required for a boggle. Boogle.js.jsx is the parent component that includes other component to generate a boggle board. Boggle component calls the rails api to generate a board, solve it and returns a list of valid words.
 
#### Rails API

Request Type: 
```GET``` 

 URL: 
 ```http://ananta-boggle.herokuapp.com/api/v1/boggles```
 
 Response Sample (when status code is 200):

 ```
 {
     "valid_words": [
         "load",
         "lovely",
         "ie"
     ],
     "board": [
         [
             "x",
             "a",
             "o",
             "l"
         ],
         [
             "d",
             "a",
             "i",
             "v"
         ],
         [
             "a",
             "i",
             "e",
             "g"
         ],
         [
             "n",
             "l",
             "y",
             "p"
         ]
     ]
 }
```

#### Rails code
There are three lib classes ```path: /lib``` Trie, Board and Boggle. Boggle class takes trie and board object to find the valid words.

##### Trie class
To build a trie I took a 3000 most common words in english from the [internet](https://www.ef.com/wwen/english-resources/english-vocabulary/top-3000-words/).

Link to [dictionary](https://github.com/anantalft/bog/blob/master/files/words.txt)

For all the words in the dictionary I built a trie data structure. Reference [stackoverflow]( https://stackoverflow.com/questions/9042426/explanation-of-ruby-code-for-building-trie-data-structures)

 Building trie logic starts with an empty hash (h={}) and then traverse through each character in the first word of the array. If the hash contains that letter, the position is updated to that hash value h=h[char]. If a character is not in the hash, that char is added to the hash with an empty hash h = {char=>{}}
  
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
##### Board class to generate a board
```
board = Board.new
```
Board will generate a 4* 4 character matrix.

##### Boogle class to solve the boggle
Boggle takes trie and board as the two params. I used depth first search to traverse through the trie data structure. Solve function solve the board and returns all the valid words
```
boggle = Boggle.new(board,trie)
boggle.solve
```
### Technology Used

* Ruby version 2.4.1
* Rails version 5.2.3
* react_on_rails gem for building and rendering react component
* Rspec for unit testing
* Heroku for deployment
* Postgres: *Note Trie data structure are saved in session in order to increase the performance. Since trie structure is huge (more than 4 kb) session data has been saved in the database table.*
* [Circle CI](https://circleci.com/) for continuous integration.

### Test
[Click to view test results](files/Selection_584.png)
### Setup instruction


```
git clone git@github.com:anantalft/bog.git
cd bog
bundle install
rake db:create
rake db:migrate
rails s

Go to url localhost:3000
```


### Known issue
* Dictionary used is limited to 3000 most common english words.

 


