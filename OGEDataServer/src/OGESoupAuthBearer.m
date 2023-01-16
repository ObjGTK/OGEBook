/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESoupAuthBearer.h"

@implementation OGESoupAuthBearer

- (ESoupAuthBearer*)SOUPAUTHBEARER
{
	return E_SOUP_AUTH_BEARER([self GOBJECT]);
}

- (bool)isExpired
{
	return e_soup_auth_bearer_is_expired([self SOUPAUTHBEARER]);
}

- (void)setAccessTokenWithAccessToken:(OFString*)accessToken expiresInSeconds:(gint)expiresInSeconds
{
	e_soup_auth_bearer_set_access_token([self SOUPAUTHBEARER], [accessToken UTF8String], expiresInSeconds);
}


@end