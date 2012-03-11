import com.restfb.exception.FacebookOAuthException
import grails.plugins.facebooksdk.FacebookGraphClient

class AppController {
	
	def facebookAppService

	def beforeInterceptor = [action:this.&before]
	def afterInterceptor = [action:this.&after]

	def before() {
		log.info("START ${actionUri} with params=${params}")
	}
	
	def after(model) {
		log.info("END ${actionUri}")
	}

	def index = {
		// See if there is a user from a cookie or session
		FacebookGraphClient facebookGraphClient = new FacebookGraphClient()
		def user
		List userFriends = []
		if (request.facebook.authenticated) {
			try {
				String userAccessToken = facebookAppService.getUserAccessToken()
				facebookGraphClient = new FacebookGraphClient(userAccessToken)
				user = facebookGraphClient.fetchObject(request.facebook.user.id.toString())
				userFriends = facebookGraphClient.fetchConnection("${request.facebook.user.id}/friends", [limit:10])
			} catch (FacebookOAuthException exception) {
				// Usually an invalid session (OAuthInvalidTokenException), for example if the user logged out from facebook.com
				facebookAppService.invalidateUser()
				facebookGraphClient = new FacebookGraphClient()
			}
		}
		
		// This call will always work since we are fetching public data.
		def benorama = facebookGraphClient.fetchObject('benorama')
		return 	[benorama:benorama,
				user:user,
				userFriends:userFriends]
	}

}
