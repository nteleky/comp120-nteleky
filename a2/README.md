Assignment 2: MessageHub
=====================================
## Comp120: Web Engineering ##
### Nicholas Teleky ###
### Oct 8, 2013 ###

- - - - - - - - - - - - - - - - - - -

For Assignment 2, I was required to use Ruby on Rails to build a web application that can 
push and pull short messages. In essence, this application would be like a newsfeed from Twitter, 
which auto-updates as new messages are posted without having to refresh the page.

This readme contains the specs of the project, what was implemented correctly and incorrectly, 
how messages can be posted locally, and how long this assignment took

- - - - - - - - - - - - - - - - - - - - -

To create this application, I used Ruby 2.0.0 and Rails 4.0.0. While SQLite is used as the 
development server, PostgreSQL would be used in production (i.e. if this app were pushed to 
something like Heroku.). I also included a bootstrap-sass gem, which allowed me to use bootstrap
formatting in the project.

As per specifications, the application has two models:
* App - contains information about where each message comes from.
* Message - contains the message content, what app was used to post the message, and the username
 of the person that posted it.

The App table was seeded with several default applications. The Message table is seeded with one 
default message, welcoming a user and telling them how to post messages.

There is one controller, Messages, which controls this app. It has three actions:
  1. index -- displays all active messages in descending format.
  2. show -- displays one message via a specified ID
  3. create -- allows a message to be created via JSON format.

- - - - - - - - - - - - - - - - - - - - - -

##### How To Create A Message #####

To create a message, use `curl` and connect to the localhost server (`http://127.0.0.1:3000`). 
An example message:

``curl --data 'message[username]=TestUser&message[content]=MessageTest&message[app_id]=1' http://127.0.0.1:3000/messages ``

- - - - - - - - - - - - - - - - - - - - - - -

This app also displays the time the message was posted in "Time Ago Format" (i.e. English).
To accomplish this, a jQuery plugin called [timeago](http://timeago.yarp.com/) was used.

- - - - - - - - - - - - - - - - - - - - - - - -

In order to poll the database to update the messages posted without refreshing the page, jQuery was
used. The application uses jQuery to get the 'created_at' attribute for the last post, polls the database every 5 seconds,
and only posts messages that were created after the last message was added to the DOM.

As a reference to learn how to do this, I used [RailsCast #229](http://railscasts.com/episodes/229-polling-for-changes)

- - - - - - - - - - - - - - - - - - - - - - - -

All parts of this assignment have been implemented correctly.

To view on heroku, go to the following link:

http://fast-reef-2117.herokuapp.com/

This assignment took me 13 hours to complete.
