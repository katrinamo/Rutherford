# Rutherford
Rutherford is a humble Discord bot written in Ruby that uses the 
discordrb API. He's currently only accepting a few commands.

## Installation

Make sure you have rvm installed using Ruby 2.3. Use bundle to install
discordrb as specified in its installation instructions.

Clone this repository and add your token. To run simply type:

```ruby run.rb```


## Commands
Each command is prefaced with '!'

`help` 
Displays the current commands with a description.

`water start|stop` 
Starts or stops a water tracker that operates for at max four hours. 
Every hour it sends the user a message reminding them (gently) to drink
some water. Ideal for people who forget during intense gaming, coding,
or working sessiong.

`ping` 
Reponds with 'Pong!' and the response time. Taken from the discordrb
examples.

`thanks` 
Show Rutherford some appreciation.
