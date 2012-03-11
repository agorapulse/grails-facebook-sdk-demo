Facebook SDK Grails Demo
================================

Demo app for [Facebook SDK Grails plugin](https://github.com/benorama/facebook-sdk-grails-plugin).

## Getting started

**1- Download or clone the [plugin GitHub project](https://github.com/benorama/facebook-sdk-grails-demo).**

```groovy
git clone https://benorama@github.com/benorama/facebook-sdk-grails-demo.git
```

**2- Create a Facebook app on [Facebook Developers](https://developers.facebook.com/apps), in order to get your own app ID and app secret.**

Configure your Facebook app as below:

* *App name space* = my-app-name-space
* *App domain* = localhost
* *Website URL* = http://localhost:8080/facebook-sdk-grails-demo/website/
* *App on Facebook* = http://localhost:8080/facebook-sdk-grails-demo/app/
* *sandbox mode* = enabled (in Advanced setting, to be able to use the app on Facebook without SSL certificate)

**3- Add your Facebook app parameters to _grails-app/conf/Config.groovy_.**

```groovy
grails.plugins.facebooksdk.appId = {APP_ID}
grails.plugins.facebooksdk.appPermissions = {APP_PERMISSIONS}
grails.plugins.facebooksdk.appSecret = {APP_SECRET}
```

**4-Run the app from the project root.** 

```groovy
grails run-app
```

Browse to :

* <http://localhost:8080/facebook-sdk-grails-demo/website/> for the website example
* <http://apps.facebook.com/my-app-name-space> for the app example on Facebook