current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "florakarniav"
client_key               "#{current_dir}/florakarniav.pem"
validation_client_name   "florakarniav-validator"
validation_key           "#{current_dir}/florakarniav-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/florakarniav"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
knife[:editor]="vim"
