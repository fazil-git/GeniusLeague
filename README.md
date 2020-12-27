#Hi Everyone!

###Online secure quiz conducting/ranking application to test your IQ

###Check out quick video demonstration: https://youtu.be/vMFrxoLYilY

##Task
Build an interactive quiz conducting web application which fetches quiz data from database, evaluates the user's answers and updates the database. Also it should authenticate existing user, create new user, user profile visualization, session management and logout facility. In addition to that it should show leaderboard list with ranking based on score.

##Summary
This app is built with loosely coupled components using MVC design pattern. Each component works separately so that this application highly scalable, easy to migrate data, and provides flexibility to run across different platforms. This application has login and new user signup including front-end and back-end input data security checks, data manipulation and filters.

##Functionality
This application first authenticates the user, if it's a new user, he/she can register as a new user (that data will be updated in the database). After that user is allowed to take the quiz, and visualize their profile. Then it performs answer validation and updates the result in DB. This application generates leaderboard with ranking, which is a list of users who scored points from high to low (to promote healthy competition among peers). In addition to that this app maintains session scope and re-validates every request from the user, it also provides cache control and disabling browser backward key to visit the last page after the session is over.

##TODOs
In this project I chose simple & familiar UI design which is preferred by most of the 'computer adaptive test' examiners. Next step is to provide functional 'forget password' step to push mail to the user,and signup/login using google facility.
In addition to that this application will have study material, student learning programs, and mainly competitive programming preparation and coding contests in future.

##Tools and Technologies
* Java
* Servlet
* JSP
* JDBC
* MySQL 
* Bootstrap css
* HTML 5
* JavaScript
* Apache Tomcat
* MVC Design

##Run locally
* Run this command git clone https://github.com/fazil-git/geniusleague.git 
* Double check your ports.. that can cause errors  
* You will be in development environment and you can play around.
(And I have used eclipse to build this project though)
* Open userGL.sql file in the project and create a database and two tables using those steps. (You can use whatever database server you want; I have used MySQL server).
* You can download JDBC driver for your DB. But in this project I have placed all the necessary JAR files and JDBC driver in WEB-INF folder. So no need to download separately.
* Google it to configure Apache tomcat server.
* If server is facing connectivity issues try placing a copy of JDBC driver inside Apache Tomcat lib folder.