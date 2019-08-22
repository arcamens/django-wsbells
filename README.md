# django-wsbells

This django package aims to abstract most of the complexity behind implementing Web Sockets. It turns out to be a nap implementing Web Applications that
demand the usage of Web Sockets like chatting platforms etc.

The django-wsbells tool uses rabbitmq broker to delegate messages to the users.

# Install

# Demo

The django-wsbells package comes with a demo whose intent is clarify the workings of it. The demo is a basic chat application that
comes with a basic user sign up and login system. 

# RabbitMQ

It is necessary to get RabbitMQ running first. Once RabbitMQ is installed just follow the steps below:

~~~
~~~

# Introduction


In your front-end/index application  you should have the following django template tag:
This code is responsible by dropping the appropriated js code to connect your browser with RabbitMQ through
a Web Socket connection.

~~~html
{{user.ws_connection | safe}}
~~~

It is necessary to have in mind that wsbells demand you to include JQuery in your front end. The events sent by the server
are trigged using JQuery.
