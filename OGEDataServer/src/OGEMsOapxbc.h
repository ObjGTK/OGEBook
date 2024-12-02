/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <libedataserver/libedataserver.h>

#import <OGObject/OGObject.h>

@class OGCancellable;

@interface OGEMsOapxbc : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initSyncWithClientId:(OFString*)clientId authority:(OFString*)authority cancellable:(OGCancellable*)cancellable;

/**
 * Methods
 */

- (EMsOapxbc*)castedGObject;

/**
 * Synchronously calls acquirePrtSsoCookie() D-Bus method on the Microsoft
 * OAuth2 broker service and converts the result into a new #SoupCookie.
 * The account object needs to be taken from the accounts list that is returned by
 * e_ms_oapxbc_get_accounts_sync(). The SSO URL is the OAuth2 authentication endpoint.
 * The scopes are the requested scopes for the OAuth2 service (usually only
 * https://graph.microsoft.com/.default). The redirect URI is the OAuth2 service
 * redirect URI.
 *
 * @param account an account returned from e_ms_oapxbc_get_accounts_sync()
 * @param ssoUrl an SSO URL to acquire the PRT SSO cookie for.
 * @param scopes array of scopes
 * @param redirectUri redirect URI
 * @param cancellable a #GCancellable
 * @return an acquired cookie, or %NULL on error
 */
- (SoupCookie*)acquirePrtSsoCookieSyncWithAccount:(JsonObject*)account ssoUrl:(OFString*)ssoUrl scopes:(JsonArray*)scopes redirectUri:(OFString*)redirectUri cancellable:(OGCancellable*)cancellable;

/**
 * Synchronously calls getAccounts() D-Bus method on the Microsoft
 * OAuth2 broker service and returns the result as a #JsonObject.
 * 
 * The #JsonObject contains the accounts that are currently registered at the broker,
 * whereby the "accounts" node provides a #JsonArray of account entries. Note, that
 * the availability of the types and entries needs to be checked by the caller before
 * accessing them. The accounts entries can be inspected e.g. for the "username" and
 * "homeAccountId" fields. Then, one entry needs to be selected and passed as-is to
 * e_ms_oapxbc_acquire_prt_sso_cookie_sync().
 *
 * @param cancellable a #GCancellable
 * @return the accounts, or %NULL on error
 */
- (JsonObject*)accountsSync:(OGCancellable*)cancellable;

@end