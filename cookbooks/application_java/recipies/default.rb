
application 'my-app' do
  path         '/usr/local/my-app'
  repository   '/nas/distro/my-app.war'
  revision     '...'
    scm_provider Chef::Provider::File::Deploy
 
  java_webapp do
    database_master_role 'database_master'
    database do
      driver     'org.gjt.mm.mysql.Driver'
      database   'name'
      port       5678
      username   'user'
      password   'password'
      max_active 1
      max_idle   2
      max_wait   3
    end
  end
 
  tomcat
end
