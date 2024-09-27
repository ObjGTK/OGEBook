/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceLDAP.h"

@implementation OGESourceLDAP

- (ESourceLDAP*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceLDAP, ESourceLDAP);
}

- (OFString*)dupFilter
{
	gchar* gobjectValue = e_source_ldap_dup_filter([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupRootDn
{
	gchar* gobjectValue = e_source_ldap_dup_root_dn([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (ESourceLDAPAuthentication)authentication
{
	ESourceLDAPAuthentication returnValue = e_source_ldap_get_authentication([self castedGObject]);

	return returnValue;
}

- (bool)canBrowse
{
	bool returnValue = e_source_ldap_get_can_browse([self castedGObject]);

	return returnValue;
}

- (OFString*)filter
{
	const gchar* gobjectValue = e_source_ldap_get_filter([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (guint)limit
{
	guint returnValue = e_source_ldap_get_limit([self castedGObject]);

	return returnValue;
}

- (OFString*)rootDn
{
	const gchar* gobjectValue = e_source_ldap_get_root_dn([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (ESourceLDAPScope)scope
{
	ESourceLDAPScope returnValue = e_source_ldap_get_scope([self castedGObject]);

	return returnValue;
}

- (ESourceLDAPSecurity)security
{
	ESourceLDAPSecurity returnValue = e_source_ldap_get_security([self castedGObject]);

	return returnValue;
}

- (void)setAuthentication:(ESourceLDAPAuthentication)authentication
{
	e_source_ldap_set_authentication([self castedGObject], authentication);
}

- (void)setCanBrowse:(bool)canBrowse
{
	e_source_ldap_set_can_browse([self castedGObject], canBrowse);
}

- (void)setFilter:(OFString*)filter
{
	e_source_ldap_set_filter([self castedGObject], [filter UTF8String]);
}

- (void)setLimit:(guint)limit
{
	e_source_ldap_set_limit([self castedGObject], limit);
}

- (void)setRootDn:(OFString*)rootDn
{
	e_source_ldap_set_root_dn([self castedGObject], [rootDn UTF8String]);
}

- (void)setScope:(ESourceLDAPScope)scope
{
	e_source_ldap_set_scope([self castedGObject], scope);
}

- (void)setSecurity:(ESourceLDAPSecurity)security
{
	e_source_ldap_set_security([self castedGObject], security);
}


@end