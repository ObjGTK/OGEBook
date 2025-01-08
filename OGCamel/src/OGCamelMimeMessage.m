/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeMessage.h"

#import "OGCamelInternetAddress.h"

@implementation OGCamelMimeMessage

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_MIME_MESSAGE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)init
{
	CamelMimeMessage* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_mime_message_new(), CamelMimeMessage, CamelMimeMessage);

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (CamelMimeMessage*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelMimeMessage, CamelMimeMessage);
}

- (OFString*)buildMboxFrom
{
	gchar* gobjectValue = camel_mime_message_build_mbox_from([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (void)dump:(gint)body
{
	camel_mime_message_dump([self castedGObject], body);
}

- (void)encode8bitParts
{
	camel_mime_message_encode_8bit_parts([self castedGObject]);
}

- (void)foreachPartWithCallback:(CamelForeachPartFunc)callback userData:(gpointer)userData
{
	camel_mime_message_foreach_part([self castedGObject], callback, userData);
}

- (time_t)date:(gint*)offset
{
	time_t returnValue = (time_t)camel_mime_message_get_date([self castedGObject], offset);

	return returnValue;
}

- (time_t)dateReceived:(gint*)offset
{
	time_t returnValue = (time_t)camel_mime_message_get_date_received([self castedGObject], offset);

	return returnValue;
}

- (OGCamelInternetAddress*)from
{
	CamelInternetAddress* gobjectValue = camel_mime_message_get_from([self castedGObject]);

	OGCamelInternetAddress* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OFString*)messageId
{
	const gchar* gobjectValue = camel_mime_message_get_message_id([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGCamelMimePart*)partByContentId:(OFString*)contentId
{
	CamelMimePart* gobjectValue = camel_mime_message_get_part_by_content_id([self castedGObject], [contentId UTF8String]);

	OGCamelMimePart* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGCamelInternetAddress*)recipients:(OFString*)type
{
	CamelInternetAddress* gobjectValue = camel_mime_message_get_recipients([self castedGObject], [type UTF8String]);

	OGCamelInternetAddress* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGCamelInternetAddress*)replyTo
{
	CamelInternetAddress* gobjectValue = camel_mime_message_get_reply_to([self castedGObject]);

	OGCamelInternetAddress* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OFString*)source
{
	const gchar* gobjectValue = camel_mime_message_get_source([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)subject
{
	const gchar* gobjectValue = camel_mime_message_get_subject([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)has8bitParts
{
	bool returnValue = (bool)camel_mime_message_has_8bit_parts([self castedGObject]);

	return returnValue;
}

- (bool)hasAttachment
{
	bool returnValue = (bool)camel_mime_message_has_attachment([self castedGObject]);

	return returnValue;
}

- (void)setBestEncodingWithRequired:(CamelBestencRequired)required enctype:(CamelBestencEncoding)enctype
{
	camel_mime_message_set_best_encoding([self castedGObject], required, enctype);
}

- (void)setDateWithDate:(time_t)date offset:(gint)offset
{
	camel_mime_message_set_date([self castedGObject], date, offset);
}

- (void)setFrom:(OGCamelInternetAddress*)from
{
	camel_mime_message_set_from([self castedGObject], [from castedGObject]);
}

- (void)setMessageId:(OFString*)messageId
{
	camel_mime_message_set_message_id([self castedGObject], [messageId UTF8String]);
}

- (void)setRecipientsWithType:(OFString*)type recipients:(OGCamelInternetAddress*)recipients
{
	camel_mime_message_set_recipients([self castedGObject], [type UTF8String], [recipients castedGObject]);
}

- (void)setReplyTo:(OGCamelInternetAddress*)replyTo
{
	camel_mime_message_set_reply_to([self castedGObject], [replyTo castedGObject]);
}

- (void)setSource:(OFString*)sourceUid
{
	camel_mime_message_set_source([self castedGObject], [sourceUid UTF8String]);
}

- (void)setSubject:(OFString*)subject
{
	camel_mime_message_set_subject([self castedGObject], [subject UTF8String]);
}


@end