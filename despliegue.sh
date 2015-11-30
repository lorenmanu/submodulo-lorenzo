git clone https://github.com/lorenmanu/submodulo-lorenzo.git
cd submodulo-lorenzo
pwd
heroku keys:add
heroku git:clone -a combook
heroku ps:scale web=1 --app combook
heroku open --app combook
