#CS2102 Project

Think Can International Bookings

##Setting up Git
*Windows*

1. Install git bash from (http://git-scm.com/downloads) or (http://windows.github.com/)
2. Run git bash and type git clone (https://github.com/RavenXce/cs2102.git)

##Using Git
###To get the latest copy
1.	`$ git fetch`
2.	`$ git merge`

###To push changes
1.	Remember to pull the latest copy and merge first:`$ git pull`
2.	Push to remote using: `$ git push`
	

##Setting up the Dev Environment

###Installing Ruby on Rails
1. Download and install Rails from http://railsinstaller.org/en

	Make sure to get the one with Ruby 1.9 if on Windows
	
2. Verify Ruby is installed correctly: `$ ruby -v`

	You should notice that Ruby v1.9 is installed.
	
3. Check Rails version: `$ gem list --local rails`

	If it does not return v4.0, update by typing: `rails _4.0.0_ --version`

###Installing the server
1. `cd` into your working directory
2. `$ bundle install` to install gem dependencies

	On Windows OS, the following steps are needed to install mysql2 properly.
	
	> Download (http://mysql.ntu.edu.tw/Downloads/Connector-C/mysql-connector-c-noinstall-6.0.2-win32.zip)
	
	> Copy libmysql.dll from the **lib** folder into the **bin** folder of your Ruby installation
	
	> This is typically at C:/RailsInstaller/Ruby1.9.3/bin

3. Start the server using `$ rails server`
	
	The server should be running at (http://localhost:3000)
	
4. If required, perform migrations on dev database using: `$ rake db:migrate RAILS_ENV=development` 