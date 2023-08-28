local metadata =
{
	plugin =
	{
		format = 'staticLibrary',
		staticLibs = { 'plugin_facebook', },
		frameworks = { 'SafariServices', 'Accounts', 'FBSDKCoreKit',  'FBSDKLoginKit', 'FBSDKShareKit', 'FBSDKCoreKit_Basics', "FBAEMKit", "FBSDKGamingServicesKit", "Accelerate"},
		frameworksOptional = { 'AuthenticationServices' },
		delegates = { 'CoronaFacebookDelegate' },
		usesSwift = true,
	},
}

return metadata
