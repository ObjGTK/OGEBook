/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESoupAuthBearer.h"

@implementation OGESoupAuthBearer

- (ESoupAuthBearer*)castedGObject
{
	return E_SOUP_AUTH_BEARER([self gObject]);
}

- (bool)isExpired
{
	bool returnValue = e_soup_auth_bearer_is_expired([self castedGObject]);

	return returnValue;
}

- (void)setAccessTokenWithAccessToken:(OFString*)accessToken expiresInSeconds:(gint)expiresInSeconds
{
	e_soup_auth_bearer_set_access_token([self castedGObject], [accessToken UTF8String], expiresInSeconds);
}


@end