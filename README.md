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
* *Website URL* = http://localhost:8080/website/
* *App on Facebook* = https://localhost:8443/app/
* *sandbox mode* = enabled (in Advanced setting, to be able to use the app on Facebook without SSL certificate)

**3- Add your Facebook app parameters to _grails-app/conf/application.yml_.**

```yml
grails:
    plugin:
        facebooksdk:
            app:
                id: {APP_ID}
                permissions: {APP_PERMISSIONS} // Ex. ['email','user_photos']
                secret: {APP_SECRET}
```

**4-Run the app from the project root.** 

```groovy
grails run-app -https
```

Browse to :

* <http://localhost:8080/website/> for the website example
* <http://apps.facebook.com/my-app-name-space> for the app example on Facebook