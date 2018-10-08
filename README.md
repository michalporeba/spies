# SPIES

Sonic PI Experimental Studies

A collection of Sonic PI studies in which I explore techinques of writing scores or usable musical structures for live performance with sonic pi. 

---

## Time 

Studies exploring the concept of control of music material over time to create more complex score-like structures. 

### [time-01](.\time\time-01.rb)

One `live_loop` defines a simple way of producing sounds using a synthesizer and some randomization. Variables are controlled from other `live_loops` which allows for simple control over time across multiple aspects of the 'player' loop.

### [time-02](.\time\time-02.rb)

Three _player_ live loops controlled by a single _score_ live loop changing the pitches used for generation of music.

### [time-03](.\time\time-03.rb)

In this study there is a single 'player' loop that generates music using some randomisation based on only two variables: `n` (an array of notes) and `s` (name of the synthesizer to use). The two variables are controlled in two independent live loops which makes it an endless piece and allows for live experimentation. 
