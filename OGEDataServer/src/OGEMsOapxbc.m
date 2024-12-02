/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEMsOapxbc.h"

#import <OGio/OGCancellable.h>

@implementation OGEMsOapxbc

- (instancetype)initSyncWithClientId:(OFString*)clientId authority:(OFString*)authority cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	EMsOapxbc* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(e_ms_oapxbc_new_sync([clientId UTF8String], [authority UTF8String], [cancellable castedGObject], &err), EMsOapxbc, EMsOapxbc);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		if(gobjectValue != NULL)
			g_object_unref(gobjectValue);
		@throw exception;
	}

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (EMsOapxbc*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], EMsOapxbc, EMsOapxbc);
}

- (SoupCookie*)acquirePrtSsoCookieSyncWithAccount:(JsonObject*)account ssoUrl:(OFString*)ssoUrl scopes:(JsonArray*)scopes redirectUri:(OFString*)redirectUri cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	SoupCookie* returnValue = e_ms_oapxbc_acquire_prt_sso_cookie_sync([self castedGObject], account, [ssoUrl UTF8String], scopes, [redirectUri UTF8String], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (JsonObject*)accountsSync:(OGCancellable*)cancellable
{
	GError* err = NULL;

	JsonObject* returnValue = e_ms_oapxbc_get_accounts_sync([self castedGObject], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}


@end