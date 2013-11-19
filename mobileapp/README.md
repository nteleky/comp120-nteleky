Assignment 3: Mobile MessageHub
=====================================
## Comp120: Web Engineering ##
### Nicholas Teleky ###
### Nov 18, 2013 ###

- - - - - - - - - - - - - - - - - - -

For Assignment 3, I was required to build an iOS 7 application that could connect with Assignment 2, MessageHub. I had to be able to connect with 
MessageHub and post a message with a simple user interface.

This readme contains the specs of the project, what was implemented correctly and incorrectly, 
how messages can be posted locally, and how long this assignment took to complete.

- - - - - - - - - - - - - - - - - - - - -

To create this application, I used xCode and Objective-C, both of which are required for iOS development. As per specifications, 
the project has one view with:

 - Label for username
 - Textfield for username
 - Label for message content
 - Textfield for message content
 - Post button that posted the message to the server
 - Alert indicating if the post was or wasn't successful

All of the above was correctly implemented, and should currently be hooked up to communicate with Ming's MessageHub.

I attempted to create a table view to grab all JSON data currently on the server and post it to the screen. While I was successful in grabbing 
all JSON data from the server, I struggled and ultimately ran out of time to properly hook that JSON data into the table view. You can see in the 
logs that I was able to pull the JSON data and parse it to get just username and message content, however.

I did not attempt to enable push requests for this application.

- - - - - - - - - - - - - - - - - - - - - - - - -

This assignment took approximately 17 hours to complete, most of which was spent working on iOS tutorials to learn how to create an iOS 
application.

I used 2 tokens on this assignment.