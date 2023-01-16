/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceExtension.h"

@interface OGESourceLDAP : OGESourceExtension
{

}


/**
 * Methods
 */

- (ESourceLDAP*)SOURCELDAP;

/**
 *
 * @return
 */
- (OFString*)dupFilter;

/**
 *
 * @return
 */
- (OFString*)dupRootDn;

/**
 *
 * @return
 */
- (ESourceLDAPAuthentication)authentication;

/**
 *
 * @return
 */
- (bool)canBrowse;

/**
 *
 * @return
 */
- (OFString*)filter;

/**
 *
 * @return
 */
- (guint)limit;

/**
 *
 * @return
 */
- (OFString*)rootDn;

/**
 *
 * @return
 */
- (ESourceLDAPScope)scope;

/**
 *
 * @return
 */
- (ESourceLDAPSecurity)security;

/**
 *
 * @param authentication
 */
- (void)setAuthentication:(ESourceLDAPAuthentication)authentication;

/**
 *
 * @param canBrowse
 */
- (void)setCanBrowse:(bool)canBrowse;

/**
 *
 * @param filter
 */
- (void)setFilter:(OFString*)filter;

/**
 *
 * @param limit
 */
- (void)setLimit:(guint)limit;

/**
 *
 * @param rootDn
 */
- (void)setRootDn:(OFString*)rootDn;

/**
 *
 * @param scope
 */
- (void)setScope:(ESourceLDAPScope)scope;

/**
 *
 * @param security
 */
- (void)setSecurity:(ESourceLDAPSecurity)security;

@end