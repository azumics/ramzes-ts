# Ramzes-ts framework
This is an assembly of libraries for automated testing in a web environment. 
For our project we use the work of many authors and ready-made templates, which we will note below

<h2>References</h2>

*Selenoid docs* :
- https://aerokube.com/selenoid/latest/
- https://aerokube.com/selenoid-ui/latest/

*Madhank's post* :
https://medium.com/testvagrant/running-webdriverio-tests-in-containers-871e0238e31f

*WebdriverIO docs* :
https://webdriver.io/docs/api/


<h2>Modes for running tests</h2>  
<h3>Preparation</h3>  
1) Check the presence of .env file , if you don't have this file - run <strong><em>"make .env"</strong></em>  

<h3>Local mode - running tests on local machine (NO CONTAINERS)</h3>  
1) Check the presence of chromedriver,geckodirver etc. on your local machine.
 
2) Run <strong><em> "npm install"</strong></em> to get all dependencies.  

3) Change configuration file <strong><em>wdio.conf.ts</strong></em> for your requirements. 
 
4) Run <strong><em>"make test-local-machine"</strong></em>  

<h3>Local mode - running tests on local machine (CONTAINERS)</h3>  
1) Run <strong><em>"make install"</strong></em> to make your project build image. 
  
2) Change configuration file <strong><em>wdio.selenoid.conf.ts</strong></em> for your requirements.  
 
3) Run <strong><em>"make test-local-containers"</strong></em> to run your tests.  


<h3>CI mode - running tests on CI environment</h3>  

-For making a build on CI we just need run command  <strong><em>"make test-ci"</strong></em>, before that we need to pull our repo to the job(CI machine)  
-For example of using .yml files for your CI you can check great post of Madhank that I marked above.  


