# Ramzes-ts 
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


<h2>How to run tests?</h2>

Firstly, you need to check presence of tests in *tests/specs/*.ts 

![tests2](https://user-images.githubusercontent.com/61021061/188141127-81e6a8fa-7122-46e6-81ab-edb5984c9a18.png)

<em><strong>Don't forget to create your own .env file from env.sample file.</strong></em>.


In Makefile you can find special commands to run the project locally or in CI environment : 

![Makefile1](https://user-images.githubusercontent.com/61021061/188140460-4402c994-0fbb-425f-8c0c-29f289add200.png)

<h2>Steps for running tests locally</h2>
<h4> 1) Build the project with command "make build" </h4>
<h4> 2) Run tests with command "make local-run" </h4>
