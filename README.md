## Rock Paper Scissors
> Play Rock, Paper, Scissors in the browser 

## Usage 
```
$ ./bin/play <strategy> <number_of_games>
```

| Name | Type | Description |
|------|------|-------------|
| strategy | `String` | The strategy the computer opponent uses in attempt to beat you 
| number_of_games | `Number` | The number of games you want to play 

The available strategies are:

- `favorite` - computer will play the move that beats your last move. 
- `last_move` - computer will play the move that beats your most frequent move. 

## Demo
![dictionary cli demo](https://raw.github.com/joegesualdo/rock-paper-scissors/master/demo.gif)

## Tests

Run:
```
$ rspec spec/ 
```

