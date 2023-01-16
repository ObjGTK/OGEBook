/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <libedataserver/libedataserver.h>

#import <OGObject/OGObject.h>

@class OGESource;

@interface OGEGDataOAuth2Authorizer : OGObject
{

}

/**
 * Functions
 */

/**
 *
 * @return Whether the #EGDataOAuth2Authorizer is supported, which
 *    means whether evolution-data-server had been compiled with libgdata.
 */
+ (bool)supported;

/**
 * Constructors
 */
- (instancetype)initWithSource:(OGESource*)source serviceType:(GType)serviceType;

/**
 * Methods
 */

- (EGDataOAuth2Authorizer*)GDATAOAUTH2AUTHORIZER;

/**
 *
 * @return A copy of currently stored credentials,
 *    or %NULL, when none are set. Free the returned structure with
 *    e_named_parameters_free(), when no longer needed.
 * 
 * See: e_gdata_oauth2_authorizer_supported()
 */
- (ENamedParameters*)cloneCredentials;

/**
 *
 * @return a service %GType, for which the @oauth2_authorizer had been created.
 * 
 * See: e_gdata_oauth2_authorizer_supported()
 */
- (GType)serviceType;

/**
 *
 * @return Whether the internally stored token is expired.
 * 
 * See: e_gdata_oauth2_authorizer_supported()
 */
- (bool)isExpired;

/**
 *
 * @return an #ESource, for which the @oauth2_authorizer
 *    had been created, or %NULL. Free returned non-NULL object with g_object_unref(),
 *    when done with it.
 * 
 * See: e_gdata_oauth2_authorizer_supported()
 */
- (OGESource*)refSource;

/**
 * Updates internally stored credentials, used to get access token.
 * 
 * See: e_gdata_oauth2_authorizer_supported()
 *
 * @param credentials credentials to set, or %NULL
 */
- (void)setCredentials:(const ENamedParameters*)credentials;

@end