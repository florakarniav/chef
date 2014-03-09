include_recipe "database::mysql"

# Store this in a variable so we don't keep repeating it
mysql_connection_info = {
    :host => "localhost",
    :username => 'root',
    # automatically get this from the override_attributes call!
    :password => node['mysql']['server_root_password']
}

# my_database = database name
mysql_database 'my_database' do
  connection mysql_connection_info
  action :create
end

# import an sql dump from your app_root/data/dump.sql to the my_database database
execute "import" do
  command "mysql -u root -p\"#{node['mysql']['server_root_password']}\" my_database < /srv/site/data/dump.sql"
  action :run
end

