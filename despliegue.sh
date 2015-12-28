git clone https://github.com/lorenmanu/submodulo-lorenzo.git
cd submodulo-lorenzo
pwd
heroku keys:add
heroku git:clone -a myclient
heroku ps:scale web=1 --app myclient
heroku open --app myclient
