/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceWebdav.h"

#import <OGio/OGTlsCertificate.h>

@implementation OGESourceWebdav

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_SOURCE_WEBDAV;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (ESourceWebdav*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceWebdav, ESourceWebdav);
}

- (OFString*)dupColor
{
	gchar* gobjectValue = e_source_webdav_dup_color([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupDisplayName
{
	gchar* gobjectValue = e_source_webdav_dup_display_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupEmailAddress
{
	gchar* gobjectValue = e_source_webdav_dup_email_address([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupResourcePath
{
	gchar* gobjectValue = e_source_webdav_dup_resource_path([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupResourceQuery
{
	gchar* gobjectValue = e_source_webdav_dup_resource_query([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupSslTrust
{
	gchar* gobjectValue = e_source_webdav_dup_ssl_trust([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (GUri*)dupUri
{
	GUri* returnValue = (GUri*)e_source_webdav_dup_uri([self castedGObject]);

	return returnValue;
}

- (bool)avoidIfmatch
{
	bool returnValue = (bool)e_source_webdav_get_avoid_ifmatch([self castedGObject]);

	return returnValue;
}

- (bool)calendarAutoSchedule
{
	bool returnValue = (bool)e_source_webdav_get_calendar_auto_schedule([self castedGObject]);

	return returnValue;
}

- (OFString*)color
{
	const gchar* gobjectValue = e_source_webdav_get_color([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)displayName
{
	const gchar* gobjectValue = e_source_webdav_get_display_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)emailAddress
{
	const gchar* gobjectValue = e_source_webdav_get_email_address([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (guint)order
{
	guint returnValue = (guint)e_source_webdav_get_order([self castedGObject]);

	return returnValue;
}

- (OFString*)resourcePath
{
	const gchar* gobjectValue = e_source_webdav_get_resource_path([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)resourceQuery
{
	const gchar* gobjectValue = e_source_webdav_get_resource_query([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)sslTrust
{
	const gchar* gobjectValue = e_source_webdav_get_ssl_trust([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (ETrustPromptResponse)sslTrustResponse
{
	ETrustPromptResponse returnValue = (ETrustPromptResponse)e_source_webdav_get_ssl_trust_response([self castedGObject]);

	return returnValue;
}

- (void)setAvoidIfmatch:(bool)avoidIfmatch
{
	e_source_webdav_set_avoid_ifmatch([self castedGObject], avoidIfmatch);
}

- (void)setCalendarAutoSchedule:(bool)calendarAutoSchedule
{
	e_source_webdav_set_calendar_auto_schedule([self castedGObject], calendarAutoSchedule);
}

- (void)setColor:(OFString*)color
{
	e_source_webdav_set_color([self castedGObject], [color UTF8String]);
}

- (void)setDisplayName:(OFString*)displayName
{
	e_source_webdav_set_display_name([self castedGObject], [displayName UTF8String]);
}

- (void)setEmailAddress:(OFString*)emailAddress
{
	e_source_webdav_set_email_address([self castedGObject], [emailAddress UTF8String]);
}

- (void)setOrder:(guint)order
{
	e_source_webdav_set_order([self castedGObject], order);
}

- (void)setResourcePath:(OFString*)resourcePath
{
	e_source_webdav_set_resource_path([self castedGObject], [resourcePath UTF8String]);
}

- (void)setResourceQuery:(OFString*)resourceQuery
{
	e_source_webdav_set_resource_query([self castedGObject], [resourceQuery UTF8String]);
}

- (void)setSslTrust:(OFString*)sslTrust
{
	e_source_webdav_set_ssl_trust([self castedGObject], [sslTrust UTF8String]);
}

- (void)setSslTrustResponse:(ETrustPromptResponse)response
{
	e_source_webdav_set_ssl_trust_response([self castedGObject], response);
}

- (void)setUri:(GUri*)uri
{
	e_source_webdav_set_uri([self castedGObject], uri);
}

- (void)unsetTemporarySslTrust
{
	e_source_webdav_unset_temporary_ssl_trust([self castedGObject]);
}

- (void)updateSslTrustWithHost:(OFString*)host cert:(OGTlsCertificate*)cert response:(ETrustPromptResponse)response
{
	e_source_webdav_update_ssl_trust([self castedGObject], [host UTF8String], [cert castedGObject], response);
}

- (ETrustPromptResponse)verifySslTrustWithHost:(OFString*)host cert:(OGTlsCertificate*)cert certErrors:(GTlsCertificateFlags)certErrors
{
	ETrustPromptResponse returnValue = (ETrustPromptResponse)e_source_webdav_verify_ssl_trust([self castedGObject], [host UTF8String], [cert castedGObject], certErrors);

	return returnValue;
}


@end