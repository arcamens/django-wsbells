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
# merge staging into master.
git checkout master
git merge staging
git push -u origin master
git checkout staging
##############################################################################
# opus, pull.
cd ~/projects/opus-code
git pull
##############################################################################
git tag -a 1.0.0 
git push origin : 1.0.0

