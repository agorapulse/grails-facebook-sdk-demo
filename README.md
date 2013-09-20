Grails Facebook SDK - Demo
==========================

Demo app for [Grails Facebook SDK plugin](https://github.com/agorapulse/grails-facebook-sdk).

## Getting started

**1- Download or clone the [plugin GitHub project](https://github.com/agorapulse/grails-facebook-sdk-demo).**

```groovy
git clone https://agorapulse@github.com/agorapulse/grails-facebook-sdk-demo.git
```

**2- Create a Facebook app on [Facebook Developers](https://developers.facebook.com/apps), in order to get your own app ID and app secret.**

Configure your Facebook app as below:

* *App name space* = my-app-name-space
* *App domain* = localhost
* *Website URL* = http://localhost:8080/facebook-sdk-demo/website/
* *App on Facebook* = http://localhost:8080/facebook-sdk-demo/app/
* *sandbox mode* = enabled (in Advanced setting, to be able to use the app on Facebook without SSL certificate)

**3- Add your Facebook app parameters to _grails-app/conf/Config.groovy_.**

```groovy
grails.plugin.facebooksdk.appId = {YOUR_APP_ID}
grails.plugin.facebooksdk.appPermissions = {YOUR_APP_PERMISSIONS}
grails.plugin.facebooksdk.appSecret = {YOUR_APP_SECRET}
```

**4-Run the app from the project root.** 

```groovy
grails run-app
```

Browse to :

* <http://localhost:8080/facebook-sdk-demo/website/> for the website example
* <http://apps.facebook.com/my-app-name-space> for the app example on Facebook