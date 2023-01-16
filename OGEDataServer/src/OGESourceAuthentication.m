/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceAuthentication.h"

@implementation OGESourceAuthentication

- (ESourceAuthentication*)SOURCEAUTHENTICATION
{
	return E_SOURCE_AUTHENTICATION([self GOBJECT]);
}

- (OFString*)dupCredentialName
{
	return [OFString stringWithUTF8String:e_source_authentication_dup_credential_name([self SOURCEAUTHENTICATION])];
}

- (OFString*)dupHost
{
	return [OFString stringWithUTF8String:e_source_authentication_dup_host([self SOURCEAUTHENTICATION])];
}

- (OFString*)dupMethod
{
	return [OFString stringWithUTF8String:e_source_authentication_dup_method([self SOURCEAUTHENTICATION])];
}

- (OFString*)dupProxyUid
{
	return [OFString stringWithUTF8String:e_source_authentication_dup_proxy_uid([self SOURCEAUTHENTICATION])];
}

- (OFString*)dupUser
{
	return [OFString stringWithUTF8String:e_source_authentication_dup_user([self SOURCEAUTHENTICATION])];
}

- (OFString*)credentialName
{
	return [OFString stringWithUTF8String:e_source_authentication_get_credential_name([self SOURCEAUTHENTICATION])];
}

- (OFString*)host
{
	return [OFString stringWithUTF8String:e_source_authentication_get_host([self SOURCEAUTHENTICATION])];
}

- (bool)isExternal
{
	return e_source_authentication_get_is_external([self SOURCEAUTHENTICATION]);
}

- (OFString*)method
{
	return [OFString stringWithUTF8String:e_source_authentication_get_method([self SOURCEAUTHENTICATION])];
}

- (guint16)port
{
	return e_source_authentication_get_port([self SOURCEAUTHENTICATION]);
}

- (OFString*)proxyUid
{
	return [OFString stringWithUTF8String:e_source_authentication_get_proxy_uid([self SOURCEAUTHENTICATION])];
}

- (bool)rememberPassword
{
	return e_source_authentication_get_remember_password([self SOURCEAUTHENTICATION]);
}

- (OFString*)user
{
	return [OFString stringWithUTF8String:e_source_authentication_get_user([self SOURCEAUTHENTICATION])];
}

- (GSocketConnectable*)refConnectable
{
	return e_source_authentication_ref_connectable([self SOURCEAUTHENTICATION]);
}

- (bool)required
{
	return e_source_authentication_required([self SOURCEAUTHENTICATION]);
}

- (void)setCredentialName:(OFString*)credentialName
{
	e_source_authentication_set_credential_name([self SOURCEAUTHENTICATION], [credentialName UTF8String]);
}

- (void)setHost:(OFString*)host
{
	e_source_authentication_set_host([self SOURCEAUTHENTICATION], [host UTF8String]);
}

- (void)setIsExternal:(bool)isExternal
{
	e_source_authentication_set_is_external([self SOURCEAUTHENTICATION], isExternal);
}

- (void)setMethod:(OFString*)method
{
	e_source_authentication_set_method([self SOURCEAUTHENTICATION], [method UTF8String]);
}

- (void)setPort:(guint16)port
{
	e_source_authentication_set_port([self SOURCEAUTHENTICATION], port);
}

- (void)setProxyUid:(OFString*)proxyUid
{
	e_source_authentication_set_proxy_uid([self SOURCEAUTHENTICATION], [proxyUid UTF8String]);
}

- (void)setRememberPassword:(bool)rememberPassword
{
	e_source_authentication_set_remember_password([self SOURCEAUTHENTICATION], rememberPassword);
}

- (void)setUser:(OFString*)user
{
	e_source_authentication_set_user([self SOURCEAUTHENTICATION], [user UTF8String]);
}


@end