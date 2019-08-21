##############################################################################
# push django-wsbells staging branch.
cd ~/projects/django-wsbells-code
# clean up all .pyc files. 
find . -name "*.pyc" -exec rm -f {} \;
rm -fr ~/projects/django-wsbells-code/static/media
git status
git add *
git commit -a
git push -u origin staging
#############################################################################
# push django-wsbells on master.
cd ~/projects/django-wsbells-code
# clean up all .pyc files. 
find . -name "*.pyc" -exec rm -f {} \;

git status
git add *
git commit -a
git push -u origin master
##############################################################################
# merge staging into master.
git checkout master
git merge staging
git push -u origin master
git checkout staging
##############################################################################
# merge master into staging.
git checkout staging
git merge master
git push -u origin staging
git checkout staging

##############################################################################
cd ~/projects/django-wsbells-code
git pull
##############################################################################
# erase database.
cd ~/projects/django-wsbells-code
python manage.py blowdb
./create-superusers
./build-data

python manage.py makemigrations
python manage.py migrate
y
##############################################################################
# create staging branch.
git checkout -b staging
git push --set-upstream origin staging
##############################################################################
# run django-wsbells project.
cd ~/projects/django-wsbells-code
stdbuf -o 0 python manage.py runserver 0.0.0.0:8000
#####k#########################################################################
# create django-wsbells virtualenv.
cd ~/.virtualenvs/
ls -la
# by default, python3 has executable named python in arch linux.
virtualenv django-wsbells -p python3.5
#####k#########################################################################
# activate django-wsbells virtualenv.
cd ~/.virtualenvs/
source django-wsbells/bin/activate
cd ~/projects/django-wsbells-code
##############################################################################
# install django-wsbells dependencies virtualenv.
cd ~/.virtualenvs/
source django-wsbells/bin/activate
cd ~/projects/django-wsbells-code
pip install -r requirements.txt 
##############################################################################
# create django-wsbells project/demo.
cd ~/projects/
django-admin startproject wschat django-wsbells-code
##############################################################################
# create core_app app.
cd ~/projects/django-wsbells-code
python manage.py startapp core_app
##############################################################################
# delete last commit.

cd ~/projects/django-wsbells-code
git reset HEAD^ --hard
git push -f
##############################################################################
# check whether rabbitmq is running mqtt server on the port 
# for paho.
lsof -i tcp:1883

# check whether rabbitmq is running mqtt websocket server on the
# port for paho.

lsof -i tcp:15675
##############################################################################
# install rabbitmq mqqt plugin.

# Exchanges: messages sent to exchange get dispatched to the queues
# that are binded to it.
# rabbitmq-mqtt plugin has a default exchange amq.topic, consumers(ws clients)
# consume from queues binded to this exchange.
# the /ws thing is one default exchange for ws clients.
rabbitmq-plugins enable rabbitmq_web_mqtt

# https://www.rabbitmq.com/mqtt.html
# http://www.steves-internet-guide.com/into-mqtt-python-client/

# it explains the /ws.
# The /ws is an endpoint exposed by the plugin.
# https://www.rabbitmq.com/web-mqtt.html

# setting up rabbitmq to work on server.

tee -i >(stdbuf -o 0 ssh admin@staging.django-wsbells.com 'bash -i')

# first enable the management tool.
rabbitmq-plugins enable rabbitmq_management

# we can access from here:
# http://opus.test.splittask.net:15672/

# we need to create a test user
# then grant permissions to it on vhost /
# because mqtt plugin uses guest for default
# and guest is not allowed to access remotely the broker.

rabbitmqctl add_user test test
rabbitmqctl set_user_tags test administrator
rabbitmqctl set_permissions -p / test ".*" ".*" ".*"

# then we create the configuration file for setting up
# the user for the mqtt plugin.
# the web_mqtt plugin relies on mqtt plugin
# it is a dependency.
# we set the user as test/test.
echo '
[{rabbit,        [{tcp_listeners,    [5672]}]},
 {rabbitmq_mqtt, [{default_user,     <<"test">>},
                  {default_pass,     <<"test">>},
                  {allow_anonymous,  true},
                  {vhost,            <<"/">>},
                  {exchange,         <<"amq.topic">>},
                  {subscription_ttl, 1800000},
                  {prefetch,         10},
                  {ssl_listeners,    []},
                  %% Default MQTT with TLS port is 8883
                  %% {ssl_listeners,    [8883]}
                  {tcp_listeners,    [1883]},
                  {tcp_listen_options, [{backlog,   128},
                                        {nodelay,   true}]}]}].

' > /etc/rabbitmq/rabbitmq.config

# point the config file in the rabbitmq-env.conf
# it took me a shitload of time to understand
# that setting up the plugins should be done
# in the rabbitmq.config not in the rabbitmq-env.conf.
echo 'RABBITMQ_CONFIG_FILE=/etc/rabbitmq/rabbitmq
' > /etc/rabbitmq/rabbitmq-env.conf

rabbitmqctl stop
rabbitmqctl start&

# then we are done, it is enough to run the server.
##############################################################################
# stop django-wsbells running, kill the process.
ps aux | grep mana

##############################################################################








