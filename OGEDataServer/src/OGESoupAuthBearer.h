/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <libedataserver/libedataserver.h>

#import <OGObject/OGObject.h>

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGESoupAuthBearer : OGObject
{

}


/**
 * Methods
 */

- (ESoupAuthBearer*)castedGObject;

/**
 *
 * @return Whether the set token is expired. It is considered expired even
 *   if the e_soup_auth_bearer_set_access_token() was called set yet.
 */
- (bool)isExpired;

/**
 * This function is analogous to soup_auth_authenticate() for "Basic" HTTP
 * authentication, except it takes an OAuth 2.0 access token instead of a
 * username and password.
 * 
 * If @expires_in_seconds is greater than zero, soup_auth_is_authenticated()
 * will return %FALSE after the given number of seconds have elapsed.
 *
 * @param accessToken an OAuth 2.0 access token
 * @param expiresInSeconds expiry for @access_token, or 0 if unknown
 */
- (void)setAccessTokenWithAccessToken:(OFString*)accessToken expiresInSeconds:(gint)expiresInSeconds;

@end