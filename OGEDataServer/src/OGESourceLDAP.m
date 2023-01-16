/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceLDAP.h"

@implementation OGESourceLDAP

- (ESourceLDAP*)SOURCELDAP
{
	return E_SOURCE_LDAP([self GOBJECT]);
}

- (OFString*)dupFilter
{
	return [OFString stringWithUTF8String:e_source_ldap_dup_filter([self SOURCELDAP])];
}

- (OFString*)dupRootDn
{
	return [OFString stringWithUTF8String:e_source_ldap_dup_root_dn([self SOURCELDAP])];
}

- (ESourceLDAPAuthentication)authentication
{
	return e_source_ldap_get_authentication([self SOURCELDAP]);
}

- (bool)canBrowse
{
	return e_source_ldap_get_can_browse([self SOURCELDAP]);
}

- (OFString*)filter
{
	return [OFString stringWithUTF8String:e_source_ldap_get_filter([self SOURCELDAP])];
}

- (guint)limit
{
	return e_source_ldap_get_limit([self SOURCELDAP]);
}

- (OFString*)rootDn
{
	return [OFString stringWithUTF8String:e_source_ldap_get_root_dn([self SOURCELDAP])];
}

- (ESourceLDAPScope)scope
{
	return e_source_ldap_get_scope([self SOURCELDAP]);
}

- (ESourceLDAPSecurity)security
{
	return e_source_ldap_get_security([self SOURCELDAP]);
}

- (void)setAuthentication:(ESourceLDAPAuthentication)authentication
{
	e_source_ldap_set_authentication([self SOURCELDAP], authentication);
}

- (void)setCanBrowse:(bool)canBrowse
{
	e_source_ldap_set_can_browse([self SOURCELDAP], canBrowse);
}

- (void)setFilter:(OFString*)filter
{
	e_source_ldap_set_filter([self SOURCELDAP], [filter UTF8String]);
}

- (void)setLimit:(guint)limit
{
	e_source_ldap_set_limit([self SOURCELDAP], limit);
}

- (void)setRootDn:(OFString*)rootDn
{
	e_source_ldap_set_root_dn([self SOURCELDAP], [rootDn UTF8String]);
}

- (void)setScope:(ESourceLDAPScope)scope
{
	e_source_ldap_set_scope([self SOURCELDAP], scope);
}

- (void)setSecurity:(ESourceLDAPSecurity)security
{
	e_source_ldap_set_security([self SOURCELDAP], security);
}


@end