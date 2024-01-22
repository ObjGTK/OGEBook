/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <libedataserver/libedataserver.h>

#import <OGObject/OGObject.h>

@class OGESource;

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGEOAuth2Services : OGObject
{

}

/**
 * Functions
 */

/**
 * This is the same as e_oauth2_services_is_oauth2_alias(), except
 * it creates its own #EOAuth2Services instance and frees it at the end.
 * The #EOAuth2Services is implemented as a singleton, thus it won't be
 * much trouble, as long as there is something else having created one
 * instance.
 *
 * @param authMethod an authentication method, or %NULL
 * @return whether exists any #EOAuth2Service, with the same name as @auth_method.
 */
+ (bool)isOauth2AliasStatic:(OFString*)authMethod;

/**
 *
 * @return %TRUE, when evolution-data-server had been compiled
 *    with OAuth2 authentication enabled, %FALSE otherwise.
 */
+ (bool)isSupported;

/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (EOAuth2Services*)castedGObject;

/**
 * Adds the @service to the list of known OAuth2 services into @services.
 * It also adds a reference to @service.
 *
 * @param service an #EOAuth2Service to add
 */
- (void)add:(EOAuth2Service*)service;

/**
 * Searches the list of currently known OAuth2 services for the one which
 * can be used with the given @source.
 * 
 * The returned #EOAuth2Service is referenced for thread safety, if found.
 *
 * @param source an #ESource
 * @return a referenced #EOAuth2Service, which can be used
 *    with given @source, or %NULL, when none was found.
 */
- (EOAuth2Service*)find:(OGESource*)source;

/**
 * Searches the list of currently known OAuth2 services for the one which
 * can be used with the given @protocol and/or @hostname.
 * Any of @protocol and @hostname can be %NULL, but not both.
 * It's up to each #EOAuth2Service to decide, which of the arguments
 * are important and whether all or only any of them can be required.
 * 
 * The returned #EOAuth2Service is referenced for thread safety, if found.
 *
 * @param protocol a protocol to search the service for, like "imap", or %NULL
 * @param hostname a host name to search the service for, like "server.example.com", or %NULL
 * @return a referenced #EOAuth2Service, which can be used
 *    with given constraints, or %NULL, when none was found.
 */
- (EOAuth2Service*)guessWithProtocol:(OFString*)protocol hostname:(OFString*)hostname;

/**
 *
 * @param authMethod an authentication method, or %NULL
 * @return whether exists any #EOAuth2Service, with the same name as @auth_method.
 * 
 * See: e_oauth2_services_is_oauth2_alias_static()
 */
- (bool)isOauth2Alias:(OFString*)authMethod;

/**
 * Lists all currently known services, which had been added
 * with e_oauth2_services_add(). Free the returned #GSList with
 * g_slist_remove_full (known_services, g_object_unref);
 * when no longer needed.
 *
 * @return a newly allocated #GSList
 *    with all currently known #EOAuth2Service referenced instances
 */
- (GSList*)list;

/**
 * Removes the @service from the list of known services in @services.
 * The function does nothing, if the @service had not been added.
 *
 * @param service an #EOAuth2Service to remove
 */
- (void)remove:(EOAuth2Service*)service;

@end