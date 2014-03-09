#application 'hallo' do
#	path '/home/florakarniav/chef-repo/hallo.java'
	#repository '/u1/jag/hello-3.0.war'
	
#	scm_provider Chef::Provider::File::Deploy
 
	
		
    		database do
      			driver     'org.gjt.mm.mysql.Driver'
      			database   'sonar'
      			port       5678
      			username   'root'
      			password   'joUQeW_ZPI_CY_HsmVJU'
      			max_active 1
      			max_idle   2
      			max_wait   3
    		end
 
	tomcat
#end
