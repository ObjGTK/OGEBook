/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceWebdav.h"

@implementation OGESourceWebdav

- (ESourceWebdav*)SOURCEWEBDAV
{
	return E_SOURCE_WEBDAV([self GOBJECT]);
}

- (OFString*)dupColor
{
	return [OFString stringWithUTF8String:e_source_webdav_dup_color([self SOURCEWEBDAV])];
}

- (OFString*)dupDisplayName
{
	return [OFString stringWithUTF8String:e_source_webdav_dup_display_name([self SOURCEWEBDAV])];
}

- (OFString*)dupEmailAddress
{
	return [OFString stringWithUTF8String:e_source_webdav_dup_email_address([self SOURCEWEBDAV])];
}

- (OFString*)dupResourcePath
{
	return [OFString stringWithUTF8String:e_source_webdav_dup_resource_path([self SOURCEWEBDAV])];
}

- (OFString*)dupResourceQuery
{
	return [OFString stringWithUTF8String:e_source_webdav_dup_resource_query([self SOURCEWEBDAV])];
}

- (SoupURI*)dupSoupUri
{
	return e_source_webdav_dup_soup_uri([self SOURCEWEBDAV]);
}

- (OFString*)dupSslTrust
{
	return [OFString stringWithUTF8String:e_source_webdav_dup_ssl_trust([self SOURCEWEBDAV])];
}

- (bool)avoidIfmatch
{
	return e_source_webdav_get_avoid_ifmatch([self SOURCEWEBDAV]);
}

- (bool)calendarAutoSchedule
{
	return e_source_webdav_get_calendar_auto_schedule([self SOURCEWEBDAV]);
}

- (OFString*)color
{
	return [OFString stringWithUTF8String:e_source_webdav_get_color([self SOURCEWEBDAV])];
}

- (OFString*)displayName
{
	return [OFString stringWithUTF8String:e_source_webdav_get_display_name([self SOURCEWEBDAV])];
}

- (OFString*)emailAddress
{
	return [OFString stringWithUTF8String:e_source_webdav_get_email_address([self SOURCEWEBDAV])];
}

- (OFString*)resourcePath
{
	return [OFString stringWithUTF8String:e_source_webdav_get_resource_path([self SOURCEWEBDAV])];
}

- (OFString*)resourceQuery
{
	return [OFString stringWithUTF8String:e_source_webdav_get_resource_query([self SOURCEWEBDAV])];
}

- (OFString*)sslTrust
{
	return [OFString stringWithUTF8String:e_source_webdav_get_ssl_trust([self SOURCEWEBDAV])];
}

- (ETrustPromptResponse)sslTrustResponse
{
	return e_source_webdav_get_ssl_trust_response([self SOURCEWEBDAV]);
}

- (void)setAvoidIfmatch:(bool)avoidIfmatch
{
	e_source_webdav_set_avoid_ifmatch([self SOURCEWEBDAV], avoidIfmatch);
}

- (void)setCalendarAutoSchedule:(bool)calendarAutoSchedule
{
	e_source_webdav_set_calendar_auto_schedule([self SOURCEWEBDAV], calendarAutoSchedule);
}

- (void)setColor:(OFString*)color
{
	e_source_webdav_set_color([self SOURCEWEBDAV], [color UTF8String]);
}

- (void)setDisplayName:(OFString*)displayName
{
	e_source_webdav_set_display_name([self SOURCEWEBDAV], [displayName UTF8String]);
}

- (void)setEmailAddress:(OFString*)emailAddress
{
	e_source_webdav_set_email_address([self SOURCEWEBDAV], [emailAddress UTF8String]);
}

- (void)setResourcePath:(OFString*)resourcePath
{
	e_source_webdav_set_resource_path([self SOURCEWEBDAV], [resourcePath UTF8String]);
}

- (void)setResourceQuery:(OFString*)resourceQuery
{
	e_source_webdav_set_resource_query([self SOURCEWEBDAV], [resourceQuery UTF8String]);
}

- (void)setSoupUri:(SoupURI*)soupUri
{
	e_source_webdav_set_soup_uri([self SOURCEWEBDAV], soupUri);
}

- (void)setSslTrust:(OFString*)sslTrust
{
	e_source_webdav_set_ssl_trust([self SOURCEWEBDAV], [sslTrust UTF8String]);
}

- (void)setSslTrustResponse:(ETrustPromptResponse)response
{
	e_source_webdav_set_ssl_trust_response([self SOURCEWEBDAV], response);
}

- (void)unsetTemporarySslTrust
{
	e_source_webdav_unset_temporary_ssl_trust([self SOURCEWEBDAV]);
}

- (void)updateSslTrustWithHost:(OFString*)host cert:(GTlsCertificate*)cert response:(ETrustPromptResponse)response
{
	e_source_webdav_update_ssl_trust([self SOURCEWEBDAV], [host UTF8String], cert, response);
}

- (ETrustPromptResponse)verifySslTrustWithHost:(OFString*)host cert:(GTlsCertificate*)cert certErrors:(GTlsCertificateFlags)certErrors
{
	return e_source_webdav_verify_ssl_trust([self SOURCEWEBDAV], [host UTF8String], cert, certErrors);
}


@end