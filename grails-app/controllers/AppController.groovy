import grails.plugin.facebooksdk.FacebookContext
import grails.plugin.facebooksdk.FacebookGraphClient
import com.restfb.exception.FacebookOAuthException

class AppController {

    static defaultAction = 'index'

    FacebookContext facebookContext

    def beforeInterceptor = {
        log.info "START ${actionUri} with params=${params}"
    }
    def afterInterceptor = {
        log.info "END ${actionUri}"
    }

	def index() {
		// See if there is a user from a cookie or session
		FacebookGraphClient facebookGraphClient = new FacebookGraphClient()
		def user
		List userFriends = []
		if (facebookContext.authenticated) {
            String token = facebookContext.user.token
            if (token) {
                facebookGraphClient = new FacebookGraphClient(token)
                try {
                    user = facebookGraphClient.fetchObject(facebookContext.user.id.toString())
                    userFriends = facebookGraphClient.fetchConnection("${facebookContext.user.id}/friends", [limit:10])
                } catch (FacebookOAuthException exception) {
                    facebookGraphClient = new FacebookGraphClient() // Do not use invalid token anymore
                    facebookContext.user.invalidate()
                }
            }
		}
		
		// This call will always work since we are fetching public data.
		def benorama = facebookGraphClient.fetchObject('benorama')
        [
                facebookContext: facebookContext,
                benorama: benorama,
                user: user,
                userFriends: userFriends
        ]
	}

}
