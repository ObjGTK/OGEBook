/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceProxy.h"

@implementation OGESourceProxy

- (ESourceProxy*)SOURCEPROXY
{
	return E_SOURCE_PROXY([self GOBJECT]);
}

- (OFString*)dupAutoconfigUrl
{
	return [OFString stringWithUTF8String:e_source_proxy_dup_autoconfig_url([self SOURCEPROXY])];
}

- (OFString*)dupFtpHost
{
	return [OFString stringWithUTF8String:e_source_proxy_dup_ftp_host([self SOURCEPROXY])];
}

- (OFString*)dupHttpAuthPassword
{
	return [OFString stringWithUTF8String:e_source_proxy_dup_http_auth_password([self SOURCEPROXY])];
}

- (OFString*)dupHttpAuthUser
{
	return [OFString stringWithUTF8String:e_source_proxy_dup_http_auth_user([self SOURCEPROXY])];
}

- (OFString*)dupHttpHost
{
	return [OFString stringWithUTF8String:e_source_proxy_dup_http_host([self SOURCEPROXY])];
}

- (OFString*)dupHttpsHost
{
	return [OFString stringWithUTF8String:e_source_proxy_dup_https_host([self SOURCEPROXY])];
}

- (gchar**)dupIgnoreHosts
{
	return e_source_proxy_dup_ignore_hosts([self SOURCEPROXY]);
}

- (OFString*)dupSocksHost
{
	return [OFString stringWithUTF8String:e_source_proxy_dup_socks_host([self SOURCEPROXY])];
}

- (OFString*)autoconfigUrl
{
	return [OFString stringWithUTF8String:e_source_proxy_get_autoconfig_url([self SOURCEPROXY])];
}

- (OFString*)ftpHost
{
	return [OFString stringWithUTF8String:e_source_proxy_get_ftp_host([self SOURCEPROXY])];
}

- (guint16)ftpPort
{
	return e_source_proxy_get_ftp_port([self SOURCEPROXY]);
}

- (OFString*)httpAuthPassword
{
	return [OFString stringWithUTF8String:e_source_proxy_get_http_auth_password([self SOURCEPROXY])];
}

- (OFString*)httpAuthUser
{
	return [OFString stringWithUTF8String:e_source_proxy_get_http_auth_user([self SOURCEPROXY])];
}

- (OFString*)httpHost
{
	return [OFString stringWithUTF8String:e_source_proxy_get_http_host([self SOURCEPROXY])];
}

- (guint16)httpPort
{
	return e_source_proxy_get_http_port([self SOURCEPROXY]);
}

- (bool)httpUseAuth
{
	return e_source_proxy_get_http_use_auth([self SOURCEPROXY]);
}

- (OFString*)httpsHost
{
	return [OFString stringWithUTF8String:e_source_proxy_get_https_host([self SOURCEPROXY])];
}

- (guint16)httpsPort
{
	return e_source_proxy_get_https_port([self SOURCEPROXY]);
}

- (const gchar* const*)ignoreHosts
{
	return e_source_proxy_get_ignore_hosts([self SOURCEPROXY]);
}

- (EProxyMethod)method
{
	return e_source_proxy_get_method([self SOURCEPROXY]);
}

- (OFString*)socksHost
{
	return [OFString stringWithUTF8String:e_source_proxy_get_socks_host([self SOURCEPROXY])];
}

- (guint16)socksPort
{
	return e_source_proxy_get_socks_port([self SOURCEPROXY]);
}

- (void)setAutoconfigUrl:(OFString*)autoconfigUrl
{
	e_source_proxy_set_autoconfig_url([self SOURCEPROXY], [autoconfigUrl UTF8String]);
}

- (void)setFtpHost:(OFString*)ftpHost
{
	e_source_proxy_set_ftp_host([self SOURCEPROXY], [ftpHost UTF8String]);
}

- (void)setFtpPort:(guint16)ftpPort
{
	e_source_proxy_set_ftp_port([self SOURCEPROXY], ftpPort);
}

- (void)setHttpAuthPassword:(OFString*)httpAuthPassword
{
	e_source_proxy_set_http_auth_password([self SOURCEPROXY], [httpAuthPassword UTF8String]);
}

- (void)setHttpAuthUser:(OFString*)httpAuthUser
{
	e_source_proxy_set_http_auth_user([self SOURCEPROXY], [httpAuthUser UTF8String]);
}

- (void)setHttpHost:(OFString*)httpHost
{
	e_source_proxy_set_http_host([self SOURCEPROXY], [httpHost UTF8String]);
}

- (void)setHttpPort:(guint16)httpPort
{
	e_source_proxy_set_http_port([self SOURCEPROXY], httpPort);
}

- (void)setHttpUseAuth:(bool)httpUseAuth
{
	e_source_proxy_set_http_use_auth([self SOURCEPROXY], httpUseAuth);
}

- (void)setHttpsHost:(OFString*)httpsHost
{
	e_source_proxy_set_https_host([self SOURCEPROXY], [httpsHost UTF8String]);
}

- (void)setHttpsPort:(guint16)httpsPort
{
	e_source_proxy_set_https_port([self SOURCEPROXY], httpsPort);
}

- (void)setIgnoreHosts:(const gchar* const*)ignoreHosts
{
	e_source_proxy_set_ignore_hosts([self SOURCEPROXY], ignoreHosts);
}

- (void)setMethod:(EProxyMethod)method
{
	e_source_proxy_set_method([self SOURCEPROXY], method);
}

- (void)setSocksHost:(OFString*)socksHost
{
	e_source_proxy_set_socks_host([self SOURCEPROXY], [socksHost UTF8String]);
}

- (void)setSocksPort:(guint16)socksPort
{
	e_source_proxy_set_socks_port([self SOURCEPROXY], socksPort);
}


@end