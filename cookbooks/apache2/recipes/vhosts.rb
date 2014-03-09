include_recipe "apache2"

web_app "example" do
  server_name "www.example.vm"
  server_aliases ["example.vm"]
  allow_override "all"
  docroot "/home/florakarniav/chef-repo/example/"
end

