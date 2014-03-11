include_recipe "apache2"

web_app "example" do
  server_name "192.168.50.50"
  server_aliases ["example.vm"]
  allow_override "all"
  docroot "/var/www/example"
end

