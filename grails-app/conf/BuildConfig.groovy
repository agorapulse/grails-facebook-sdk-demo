grails.servlet.version = "2.5" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.target.level = 1.6
grails.project.source.level = 1.6
//grails.project.war.file = "target/${appName}-${appVersion}.war"

grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits 'global'
    log 'error' // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve
    repositories {
        inherits true // Whether to inherit repository definitions from plugins
        grailsPlugins()
    }
    dependencies {
    }
    plugins {
        runtime ':jquery:1.8.0'
        runtime ':resources:1.1.6'
        runtime ':fbootstrapp:0.1.1'
        
        runtime ':facebook-sdk:0.4.3'

        build ":tomcat:$grailsVersion"
    }
}

//grails.plugin.location.facebookSdk = "../grails-facebook-sdk"
