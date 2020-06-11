# Node Hello World

Simple node.js app that servers "hello world"

Great for testing simple deployments to the cloud.

We have a demo of CI&CD for this project using docker to build the image for each version code and deploy to target server.
In this demo, we use the same server to host both jenkins and app server.

## Build Image:
- From Git SCM:
  - After pushing code to the target branches "staging, release", jenkins will scan periodically per 1 minutes to see any changes in the target branches. If changes, jenkins build the code.
- From Jenkins:
  - Access link: http://100.25.162.232:8080/job/Build%20Image/
  - Select the target branches which you required "staging, release" to view the build process.
## Deploy Image:
- From Jenkins:
  - Access link: http://100.25.162.232:8080/job/Deploy%20Image/
  - Build with params: ENV, VERSION
    - Note: Currently we define the VERSION variable is image tag of the  previous build step.
- From Nodejs Application Server:
  - Access link: 100.25.162.232:3000/
  - Make sure that the app version and environment are displayed correctly.


`npm start`
