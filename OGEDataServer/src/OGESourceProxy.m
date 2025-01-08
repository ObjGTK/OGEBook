/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceProxy.h"

@implementation OGESourceProxy

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_SOURCE_PROXY;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (ESourceProxy*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceProxy, ESourceProxy);
}

- (OFString*)dupAutoconfigUrl
{
	gchar* gobjectValue = e_source_proxy_dup_autoconfig_url([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupFtpHost
{
	gchar* gobjectValue = e_source_proxy_dup_ftp_host([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupHttpAuthPassword
{
	gchar* gobjectValue = e_source_proxy_dup_http_auth_password([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupHttpAuthUser
{
	gchar* gobjectValue = e_source_proxy_dup_http_auth_user([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupHttpHost
{
	gchar* gobjectValue = e_source_proxy_dup_http_host([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupHttpsHost
{
	gchar* gobjectValue = e_source_proxy_dup_https_host([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (gchar**)dupIgnoreHosts
{
	gchar** returnValue = (gchar**)e_source_proxy_dup_ignore_hosts([self castedGObject]);

	return returnValue;
}

- (OFString*)dupSocksHost
{
	gchar* gobjectValue = e_source_proxy_dup_socks_host([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)autoconfigUrl
{
	const gchar* gobjectValue = e_source_proxy_get_autoconfig_url([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)ftpHost
{
	const gchar* gobjectValue = e_source_proxy_get_ftp_host([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (guint16)ftpPort
{
	guint16 returnValue = (guint16)e_source_proxy_get_ftp_port([self castedGObject]);

	return returnValue;
}

- (OFString*)httpAuthPassword
{
	const gchar* gobjectValue = e_source_proxy_get_http_auth_password([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)httpAuthUser
{
	const gchar* gobjectValue = e_source_proxy_get_http_auth_user([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)httpHost
{
	const gchar* gobjectValue = e_source_proxy_get_http_host([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (guint16)httpPort
{
	guint16 returnValue = (guint16)e_source_proxy_get_http_port([self castedGObject]);

	return returnValue;
}

- (bool)httpUseAuth
{
	bool returnValue = (bool)e_source_proxy_get_http_use_auth([self castedGObject]);

	return returnValue;
}

- (OFString*)httpsHost
{
	const gchar* gobjectValue = e_source_proxy_get_https_host([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (guint16)httpsPort
{
	guint16 returnValue = (guint16)e_source_proxy_get_https_port([self castedGObject]);

	return returnValue;
}

- (const gchar* const*)ignoreHosts
{
	const gchar* const* returnValue = (const gchar* const*)e_source_proxy_get_ignore_hosts([self castedGObject]);

	return returnValue;
}

- (EProxyMethod)method
{
	EProxyMethod returnValue = (EProxyMethod)e_source_proxy_get_method([self castedGObject]);

	return returnValue;
}

- (OFString*)socksHost
{
	const gchar* gobjectValue = e_source_proxy_get_socks_host([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (guint16)socksPort
{
	guint16 returnValue = (guint16)e_source_proxy_get_socks_port([self castedGObject]);

	return returnValue;
}

- (void)setAutoconfigUrl:(OFString*)autoconfigUrl
{
	e_source_proxy_set_autoconfig_url([self castedGObject], [autoconfigUrl UTF8String]);
}

- (void)setFtpHost:(OFString*)ftpHost
{
	e_source_proxy_set_ftp_host([self castedGObject], [ftpHost UTF8String]);
}

- (void)setFtpPort:(guint16)ftpPort
{
	e_source_proxy_set_ftp_port([self castedGObject], ftpPort);
}

- (void)setHttpAuthPassword:(OFString*)httpAuthPassword
{
	e_source_proxy_set_http_auth_password([self castedGObject], [httpAuthPassword UTF8String]);
}

- (void)setHttpAuthUser:(OFString*)httpAuthUser
{
	e_source_proxy_set_http_auth_user([self castedGObject], [httpAuthUser UTF8String]);
}

- (void)setHttpHost:(OFString*)httpHost
{
	e_source_proxy_set_http_host([self castedGObject], [httpHost UTF8String]);
}

- (void)setHttpPort:(guint16)httpPort
{
	e_source_proxy_set_http_port([self castedGObject], httpPort);
}

- (void)setHttpUseAuth:(bool)httpUseAuth
{
	e_source_proxy_set_http_use_auth([self castedGObject], httpUseAuth);
}

- (void)setHttpsHost:(OFString*)httpsHost
{
	e_source_proxy_set_https_host([self castedGObject], [httpsHost UTF8String]);
}

- (void)setHttpsPort:(guint16)httpsPort
{
	e_source_proxy_set_https_port([self castedGObject], httpsPort);
}

- (void)setIgnoreHosts:(const gchar* const*)ignoreHosts
{
	e_source_proxy_set_ignore_hosts([self castedGObject], ignoreHosts);
}

- (void)setMethod:(EProxyMethod)method
{
	e_source_proxy_set_method([self castedGObject], method);
}

- (void)setSocksHost:(OFString*)socksHost
{
	e_source_proxy_set_socks_host([self castedGObject], [socksHost UTF8String]);
}

- (void)setSocksPort:(guint16)socksPort
{
	e_source_proxy_set_socks_port([self castedGObject], socksPort);
}


@end