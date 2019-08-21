# django-wsbells

This django package aims to abstract most of the complexity behind implementing Web Sockets. It turns out to be a nap implementing Web Applications that
demand the usage of Web Sockets like chatting platforms etc.

The django-wsbells tool uses rabbitmq broker to delegate messages to the users.

# Install

# Introduction


In your front-end/index application  you should have the following django template tag:
This code is responsible by dropping the appropriated js code to connect your browser with RabbitMQ through
a Web Socket connection.

~~~html
{{user.ws_connection | safe}}
~~~
