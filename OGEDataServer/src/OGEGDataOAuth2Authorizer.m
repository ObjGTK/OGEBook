/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEGDataOAuth2Authorizer.h"

#import "OGESource.h"

@implementation OGEGDataOAuth2Authorizer

+ (bool)supported
{
	return e_gdata_oauth2_authorizer_supported();
}

- (instancetype)initWithSource:(OGESource*)source serviceType:(GType)serviceType
{
	self = [super initWithGObject:(GObject*)e_gdata_oauth2_authorizer_new([source SOURCE], serviceType)];

	return self;
}

- (EGDataOAuth2Authorizer*)GDATAOAUTH2AUTHORIZER
{
	return E_GDATA_OAUTH2_AUTHORIZER([self GOBJECT]);
}

- (ENamedParameters*)cloneCredentials
{
	return e_gdata_oauth2_authorizer_clone_credentials([self GDATAOAUTH2AUTHORIZER]);
}

- (GType)serviceType
{
	return e_gdata_oauth2_authorizer_get_service_type([self GDATAOAUTH2AUTHORIZER]);
}

- (bool)isExpired
{
	return e_gdata_oauth2_authorizer_is_expired([self GDATAOAUTH2AUTHORIZER]);
}

- (OGESource*)refSource
{
	return [[[OGESource alloc] initWithGObject:(GObject*)e_gdata_oauth2_authorizer_ref_source([self GDATAOAUTH2AUTHORIZER])] autorelease];
}

- (void)setCredentials:(const ENamedParameters*)credentials
{
	e_gdata_oauth2_authorizer_set_credentials([self GDATAOAUTH2AUTHORIZER], credentials);
}


@end