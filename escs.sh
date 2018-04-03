##############################################################################
# push opus alpha branch.
cd ~/projects/opus-code
# clean up all .pyc files. 
find . -name "*.pyc" -exec rm -f {} \;
rm -fr ~/projects/opus-code/opus/static/media
git status
git add *
git commit -a
git push -u origin staging
##############################################################################
# push opus alpha branch.
cd ~/projects/opus-code
# clean up all .pyc files. 
find . -name "*.pyc" -exec rm -f {} \;
rm -fr ~/projects/opus-code/static/media
git status
git add *
git commit -a
git push -u origin gamma

##############################################################################
# push opus development branch.
cd ~/projects/opus-code
# clean up all .pyc files. 
find . -name "*.pyc" -exec rm -f {} \;
rm -fr ~/projects/opus-code/static/media
git status
git add *
git commit -a
git push -u origin development
##############################################################################

# push opus on master.
cd ~/projects/opus-code
# clean up all .pyc files. 
find . -name "*.pyc" -exec rm -f {} \;

git status
git add *
git commit -a
git push -u origin master
##############################################################################
# create dev branch.
cd ~/projects/opus-code
git branch -a
git checkout -b development
git push --set-upstream origin development
##############################################################################
# push, opus, beta.
cd ~/projects/opus-code
# clean up all .pyc files. 
find . -name "*.pyc" -exec rm -f {} \;
git status
git add *
git commit -a
git push -u origin beta
##############################################################################
# merge staging into master.
git checkout master
git merge staging
git push -u origin master
git checkout staging
##############################################################################
# checkout all.

git checkout *

##############################################################################

# merge, beta, into, alpha:
git checkout alpha
git merge beta
git push -u origin alpha
git checkout beta

##############################################################################
# merge, beta, into, master:
git checkout master
git merge beta
git push -u origin master
git checkout beta
##############################################################################
# merge, beta, into, alpha:
git checkout alpha
git merge beta
git push -u origin alpha
git checkout beta
##############################################################################
# merge, alpha, into, master:
git checkout master
git merge alpha
git push -u origin master
git checkout alpha
##############################################################################
# merge, alpha, into, dev:
git checkout development
git merge alpha
git push -u origin development
git checkout alpha

##############################################################################
# merge, alpha, into, master:
git checkout alpha
git merge master
git push -u origin alpha
git checkout alpha
##############################################################################

# opus, pull.
cd ~/projects/opus-code
git pull
##############################################################################
# setup, admin, site.
echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com', 'pass')" | python manage.py shell
##############################################################################
# make migrations.
cd ~/projects/opus-code
python manage.py blowdb
./build-data

# create, opus, alpha, branch.
git checkout -b alpha
git push --set-upstream origin alpha

# create, opus, beta, branch.
git checkout -b beta
git push --set-upstream origin beta

git checkout -b gamma
git push --set-upstream origin gamma

##############################################################################
# switch, alpha, branch.
git checkout alpha
##############################################################################
# switch, beta, branch.
git checkout beta

##############################################################################
# run opus project.
cd ~/projects/opus-code
stdbuf -o 0 python manage.py runserver 0.0.0.0:8000
#####k#########################################################################
# clone, opus, wiki.

cd ~/projects
git clone git@bitbucket.org:iogf/opus.git/wiki opus.wiki-code

##############################################################################
# create, setup, virtualenv, opus.
cd ~/.virtualenvs/
ls -la
# by default, python3 has executable named python in arch linux.
virtualenv opus -p /usr/bin/python
##############################################################################
# activate opus virtualenv.
cd ~/.virtualenvs/
source opus/bin/activate
cd ~/projects/opus-code
##############################################################################
# install, opus, dependencies, virtualenv.
cd ~/.virtualenvs/
source opus/bin/activate
cd ~/projects/opus-code
pip install -r requirements.txt 
##############################################################################
# create, opus, project.
cd ~/projects/
django-admin startproject opus opus-code
##############################################################################
# create core_app.
cd ~/projects/opus-code
python manage.py startapp core_app
##############################################################################
# create wsbells app.
cd ~/projects/opus-code
python manage.py startapp wsbells

##############################################################################
# create, help_app, app.
cd ~/projects/opus-code
python manage.py startapp help_app
##############################################################################
# create, register_app, app.
cd ~/projects/opus-code
python manage.py startapp register_app

##############################################################################
# create, timeline, app.
cd ~/projects/opus-code
python manage.py startapp post_app
##############################################################################
# create, chat_app, app.
cd ~/projects/opus-code
python manage.py startapp chat_app
##############################################################################
# create, comment_app, app.
cd ~/projects/opus-code
python manage.py startapp comment_app


##############################################################################
# create, timeline_app, app.
cd ~/projects/opus-code
python manage.py startapp timeline_app
##############################################################################
# create, stream, app.
cd ~/projects/opus-code
python manage.py startapp stream_app
##############################################################################
# rename, customer, to user.

cd ~/projects/opus-code

grep -rl 'arcamens' --exclude-dir='.git' ./ | xargs sed -i 's/arcamens/opus/g'

grep -rl 'board_app\.models\.User' --exclude-dir='.git' ./ | xargs sed -i 's/board_app\.models\.User/core_app.models.User/g'

grep -rl 'OrganizationEvent' --exclude-dir='.git' ./ | xargs sed -i 's/OrganizationEvent/Event/g'

grep -rl 'board_app.Labor' --exclude-dir='.git' ./ | xargs sed -i 's/board_app.Labor/core_app.Organization/g'

grep -rl 'timeline_app.Opus' --exclude-dir='.git' ./ | xargs sed -i 's/timeline_app.Opus/core_app.Organization/g'

grep -rl '\.opus' --exclude-dir='.git' ./ | xargs sed -i 's/\.opus//g'
grep -rl '\.labor' --exclude-dir='.git' ./ | xargs sed -i 's/\.labor//g'

grep -rl 'Labor' --exclude-dir='.git' ./ | xargs sed -i 's/Labor/Organization/g'
grep -rl 'Opus' --exclude-dir='.git' ./ | xargs sed -i 's/Opus/Organization/g'

cd ~/projects/labor2-code

grep -rl 'timeline_app\.User' --exclude-dir='.git' ./ | xargs sed -i 's/timeline_app\.User/core_app.User/g'

grep -rl 'user-settings' --exclude-dir='.git' ./ | xargs sed -i 's/user-settings/list-user-tags/g'

grep -rl 'timeline_app:list-timelines' --exclude-dir='.git' ./ | xargs sed -i 's/timeline_app:list-timelines/timeline_app:list-timelines/g'

cd ~/projects/opus-code

grep -rl 'core_app:profile' --exclude-dir='.git' ./ | xargs sed -i 's/core_app:profile/board_app:profile/g'


cd ~/projects/opus-code

grep -rl 'default_organization' --exclude-dir='.git' ./ | xargs sed -i 's/default_organization/default/g'

cd ~/projects/opus-code/board_app/

grep -rl 'timeline_app/' --exclude-dir='.git' ./ | xargs sed -i 's/timeline_app\//board_app\//g'

grep -rl 'timeline_app' --exclude-dir='.git' ./ | xargs sed -i 's/timeline_app/timeline_app/g'

cd ~/projects/opus-code/board_app/

grep -rl 'timeline_app/' --exclude-dir='.git' ./ | xargs sed -i 's/timeline_app\//board_app\//g'

cd ~/projects/opus-code/list_app

grep -rl 'core_app\.models' --exclude-dir='.git' ./ | xargs sed -i 's/core_app\.models/board_app.models/g'

grep -rl 'core_app\.opus' --exclude-dir='.git' ./ | xargs sed -i 's/core_app\.opus/timeline_app\.opus/g'

cd ~/projects/opus-code/board_app

grep -rl 'core_app\.models' --exclude-dir='.git' ./ | xargs sed -i 's/core_app\.models/board_app.models/g'

cd ~/projects/labor2-code

grep -rl 'Organization' --exclude-dir='.git' ./ | xargs sed -i 's/Organization/opus/g'

cd ~/projects/opus-code/timeline_app

grep -rl 'core_app:' --exclude-dir='.git' ./ | xargs sed -i 's/core_app:/timeline_app:/g'

cd ~/projects/opus-code/board_app

grep -rl 'core_app:' --exclude-dir='.git' ./ | xargs sed -i 's/core_app:/board_app:/g'


cd ~/projects/opus-code/board_app

grep -rl '#main-view' --exclude-dir='.git' ./ | xargs sed -i 's/#main-view/#main-viewport/g'

grep -rl '#main-view' --exclude-dir='.git' ./ | xargs sed -i 's/#main-view/#main-viewport/g'


grep -rl 'Comment' --exclude-dir='.git' ./ | xargs sed -i 's/Comment/PostComment/g'

grep -rl 'UserFilter' --exclude-dir='.git' ./ | xargs sed -i 's/UserFilter/opusUserFilter/g'

grep -rl 'Event' --exclude-dir='.git' ./ | xargs sed -i 's/Event/opusEvent/g'

grep -rl 'customer' --exclude-dir='.git' ./ | xargs sed -i 's/customer/user/g'

cd ~/projects/opus-code/timeline_app

grep -rl 'core_app' --exclude-dir='.git' ./ | xargs sed -i 's/core_app/timeline_app/g'

cd ~/projects/opus-code/post_app
grep -rl 'core_app' --exclude-dir='.git' ./ | xargs sed -i 's/core_app/timeline_app/g'

cd ~/projects/opus-code/post_comment_app
grep -rl 'core_app' --exclude-dir='.git' ./ | xargs sed -i 's/core_app/timeline_app/g'

cd ~/projects/opus-code/site_app
grep -rl 'core_app' --exclude-dir='.git' ./ | xargs sed -i 's/core_app/timeline_app/g'

cd ~/projects/opus-code/card_comment_app
grep -rl 'core_app' --exclude-dir='.git' ./ | xargs sed -i 's/core_app/board_app/g'

cd ~/projects/opus-code/post_app
grep -rl 'FileWrapper' --exclude-dir='.git' ./ | xargs sed -i 's/FileWrapper/PostFileWrapper/g'

cd ~/projects/opus-code/card_app
grep -rl 'FileWrapper' --exclude-dir='.git' ./ | xargs sed -i 's/FileWrapper/CardFileWrapper/g'

cd ~/projects/opus-code/board_app
grep -rl 'FileWrapper' --exclude-dir='.git' ./ | xargs sed -i 's/FileWrapper/CardFileWrapper/g'


##############################################################################
# delete, last, commit.

cd ~/projects/opus-code
git reset HEAD^ --hard
git push -f
##############################################################################
# checkout, changed, files, between, two, branches.

git diff --name-status alpha beta
##############################################################################
# merge, specific, file, from alpha.

git checkout beta 
git checkout alpha path-to-file
git commit -a
##############################################################################
# unversion, file, git, db.sqlite3.

git rm --cached db.sqlite3
git rm --cached opus/settings.py
##############################################################################
# create, signup_app, app.
cd ~/projects/opus-code
python manage.py startapp site_app
##############################################################################
# delete, beta, branch.

cd ~/projects/opus-code
git branch -d beta
git push origin :beta
git fetch -p 

##############################################################################

# delete, gamma, branch.

cd ~/projects/opus-code
git branch -d gamma
git push origin :gamma
git fetch -p 

##############################################################################

# delete, alpha, branch.

cd ~/projects/opus-code
git branch -d alpha
git push origin :alpha
git fetch -p 

##############################################################################
# create, first, release, test, tag.

git tag -a 1.0.2 -m 'Fixing design, using data-show instead of href.'
git push origin : 1.0.2

git tag -a 1.0.3 -m 'fixing bug with ManageTimelineUsers view.'
git push origin : 1.0.3



git tag -a 1.0.3 -m 'Implement prevent default in e-post/e-get.'
git push origin : 1.0.3

git tag -a 1.0.4 -m ''
git push origin : 1.0.4

##############################################################################
cd ~/projects/opus-code

# rename card_app to markdown_app.
grep -rl  'card_app' . | xargs sed -i 's/card_app/markdown_app/g' 
grep -rl  'Card' . | xargs sed -i 's/Card/Markdown/g' 
grep -rl  'card' . | xargs sed -i 's/card/markdown/g' 

##############################################################################
#fix #gitignore #remove #cached #files #ignore #folder #migrations

git rm -r --cached ./*/migrations/
git rm --cached db.sqlite3
git add .gitignore
##############################################################################
# install django-jdrop.
cd ~/projects/django-jdrop-code
python setup.py install

# uninstall django-jdrop.
pip uninstall django-jdrop
y

pip install paho-mqtt
pip install pika

##############################################################################

wget --post-data='somedata' http://189.84.248.176:8000/register_app/paypal-ipn/
##############################################################################
# install paybills in virtualenv.
cd ~/.virtualenvs/
source opus/bin/activate
cd ~/projects/django-paybills-code
python setup.py install
rm -fr build
##############################################################################
# install jsim in virtualenv.
cd ~/.virtualenvs/
source opus/bin/activate

cd ~/projects/django-jsim-code
python setup.py install
rm -fr build

##############################################################################

# access victor server through ssh.

tee -i >(stdbuf -o 0 ssh opus-test@staging.opus.com 'bash -i')

# accept signals.
tee >(stdbuf -o 0 ssh opus-test@staging.opus.com 'bash -i')

# run as supervisord.
supervisord -n -c ../conf/supervisord.conf

# remove opus and paybills.
rm -fr /home/opus-test/projects/opus-code
rm -fr /home/opus-test/projects/django-paybills-code
##############################################################################
# install paybills
cd ~/projects/django-paybills-code
python setup.py install
##############################################################################
# passphrase for victor server.
bohju9Do

##############################################################################
# deploy opus on victor server.

cp -R ~/projects/opus-code /tmp
rm -fr /tmp/opus-code/.git
find /tmp/opus-code -path "opus-code/**/migrations/*.py" -not -name "__init__.py" -delete
find /tmp/opus-code -path "opus-code/**/migrations/*.pyc" -not -name "__init__.py" -delete
find /tmp/opus-code -path "opus-code*/*.pyc" -not -name "__init__.py" -delete
find /tmp/opus-code -name "db.sqlite3" -delete

# use rsync.
rsync -r /tmp/opus-code opus-test@job-lab.net:/home/opus-test/projects

# uses scp.
scp -r /tmp/opus-code opus-test@job-lab.net:/home/opus-test/projects

# remove the old code.
ssh opus-test@job-lab.net '
rm -fr /home/opus-test/projects/opus-code'

scp -r /home/tau/projects/opus-code/build-data opus@opus.test.splittask.net:/home/opus/projects/opus-code

##############################################################################
# install paybills on victor server.

cp -R ~/projects/django-paybills-code /tmp
rm -fr /tmp/django-paybills-code/.git

scp -r /tmp/django-paybills-code opus-test@job-lab.net:/home/opus-test/projects

ssh opus-test@job-lab.net '
cd ~/.virtualenvs/
source opus/bin/activate
cd /home/opus-test/projects/django-paybills-code
sudo python setup.py install'

# create basic folders victor porton server.
mkdir ~/.virtualenvs
mkdir ~/projects
##############################################################################

pip install future
apt-get install rabbitmq
##############################################################################
#delete #remove #virtualenv
cd ~/.virtualenvs/
rm -fr opus
##############################################################################
# install blowdb
cd ~/projects/django-blowdb-code
python setup.py install
rm -fr build

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

tee -i >(stdbuf -o 0 ssh opus-test@staging.opus.com 'bash -i')

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
# run opus on victor server.

ssh root@staging.opus.com 'rabbitmq-server start;exit;'

# activate virtualenv on victor server.
cd ~/.virtualenvs/
source opus/bin/activate
cd ~/projects/opus-code

# run opus project on victor server.
cd ~/projects/opus-code
stdbuf -o 0 python manage.py runserver 0.0.0.0:8000
##############################################################################
# stop opus running, kill the process.
ps aux | grep mana

##############################################################################
# install django-slock

cd ~/projects/django-slock-code
python setup.py install
rm -fr build

##############################################################################

# install django-scrolls
cd ~/projects/django-scrolls-code
python setup.py install
rm -fr build
##############################################################################
# pair fork master branch to upstream master branch.
git fetch -p 
git checkout master
git reset --hard f7e9f0b  
git push origin master --force 

git add -f opus/static/media/user.png
##############################################################################
# grab remote branches.
git pull
git fetch
git checkout C319
##############################################################################
# merge C319 into staging
cd ~/projects/opus-code
git checkout staging
git merge C319
git push -u origin staging

git branch -d C319
git push origin :C319
git fetch -p 

##############################################################################
# merge C324 into staging
cd ~/projects/opus-code
git pull
git checkout C324
git pull
git checkout staging
git merge C324
git push -u origin staging

git branch -d C324
git push origin :C324
git fetch -p 

# merge C341 into staging
cd ~/projects/opus-code
git pull
git checkout C341
git pull
git checkout staging
git merge C341
git push -u origin staging

git branch -d C341
git push origin :C341
git fetch -p 
##############################################################################
# install django-sqlike
cd ~/projects/django-sqlike-code
python setup.py install
rm -fr build
##############################################################################
# update opus on victor vps.
tee >(stdbuf -o 0 ssh root@staging.arcamens.com 'bash -i')

su opus
cd ~/.virtualenv/
source opus/bin/activate
cd ~/projects/opus

cd ~/projects/opus
git pull 
git status
git log

# Do migrations.
python manage.py apps
python manage.py migrate
exit

# Restart the server.
sudo supervisorctl restart opus
##############################################################################
339



