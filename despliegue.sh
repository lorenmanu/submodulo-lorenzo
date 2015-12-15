git clone https://github.com/lorenmanu/submodulo-lorenzo.git
cd submodulo-lorenzo
pwd
heroku keys:add
heroku git:clone -a MiTienda
heroku ps:scale web=1 --app MiTienda
heroku open --app MiTienda
