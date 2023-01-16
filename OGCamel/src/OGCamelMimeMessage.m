/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeMessage.h"

#import "OGCamelInternetAddress.h"

@implementation OGCamelMimeMessage

- (instancetype)init
{
	self = [super initWithGObject:(GObject*)camel_mime_message_new()];

	return self;
}

- (CamelMimeMessage*)MIMEMESSAGE
{
	return CAMEL_MIME_MESSAGE([self GOBJECT]);
}

- (OFString*)buildMboxFrom
{
	return [OFString stringWithUTF8String:camel_mime_message_build_mbox_from([self MIMEMESSAGE])];
}

- (void)dump:(gint)body
{
	camel_mime_message_dump([self MIMEMESSAGE], body);
}

- (void)encode8bitParts
{
	camel_mime_message_encode_8bit_parts([self MIMEMESSAGE]);
}

- (void)foreachPartWithCallback:(CamelForeachPartFunc)callback userData:(gpointer)userData
{
	camel_mime_message_foreach_part([self MIMEMESSAGE], callback, userData);
}

- (time_t)date:(gint*)offset
{
	return camel_mime_message_get_date([self MIMEMESSAGE], offset);
}

- (time_t)dateReceived:(gint*)offset
{
	return camel_mime_message_get_date_received([self MIMEMESSAGE], offset);
}

- (OGCamelInternetAddress*)from
{
	return [[[OGCamelInternetAddress alloc] initWithGObject:(GObject*)camel_mime_message_get_from([self MIMEMESSAGE])] autorelease];
}

- (OFString*)messageId
{
	return [OFString stringWithUTF8String:camel_mime_message_get_message_id([self MIMEMESSAGE])];
}

- (OGCamelMimePart*)partByContentId:(OFString*)contentId
{
	return [[[OGCamelMimePart alloc] initWithGObject:(GObject*)camel_mime_message_get_part_by_content_id([self MIMEMESSAGE], [contentId UTF8String])] autorelease];
}

- (OGCamelInternetAddress*)recipients:(OFString*)type
{
	return [[[OGCamelInternetAddress alloc] initWithGObject:(GObject*)camel_mime_message_get_recipients([self MIMEMESSAGE], [type UTF8String])] autorelease];
}

- (OGCamelInternetAddress*)replyTo
{
	return [[[OGCamelInternetAddress alloc] initWithGObject:(GObject*)camel_mime_message_get_reply_to([self MIMEMESSAGE])] autorelease];
}

- (OFString*)source
{
	return [OFString stringWithUTF8String:camel_mime_message_get_source([self MIMEMESSAGE])];
}

- (OFString*)subject
{
	return [OFString stringWithUTF8String:camel_mime_message_get_subject([self MIMEMESSAGE])];
}

- (bool)has8bitParts
{
	return camel_mime_message_has_8bit_parts([self MIMEMESSAGE]);
}

- (bool)hasAttachment
{
	return camel_mime_message_has_attachment([self MIMEMESSAGE]);
}

- (void)setBestEncodingWithRequired:(CamelBestencRequired)required enctype:(CamelBestencEncoding)enctype
{
	camel_mime_message_set_best_encoding([self MIMEMESSAGE], required, enctype);
}

- (void)setDateWithDate:(time_t)date offset:(gint)offset
{
	camel_mime_message_set_date([self MIMEMESSAGE], date, offset);
}

- (void)setFrom:(OGCamelInternetAddress*)from
{
	camel_mime_message_set_from([self MIMEMESSAGE], [from INTERNETADDRESS]);
}

- (void)setMessageId:(OFString*)messageId
{
	camel_mime_message_set_message_id([self MIMEMESSAGE], [messageId UTF8String]);
}

- (void)setRecipientsWithType:(OFString*)type recipients:(OGCamelInternetAddress*)recipients
{
	camel_mime_message_set_recipients([self MIMEMESSAGE], [type UTF8String], [recipients INTERNETADDRESS]);
}

- (void)setReplyTo:(OGCamelInternetAddress*)replyTo
{
	camel_mime_message_set_reply_to([self MIMEMESSAGE], [replyTo INTERNETADDRESS]);
}

- (void)setSource:(OFString*)sourceUid
{
	camel_mime_message_set_source([self MIMEMESSAGE], [sourceUid UTF8String]);
}

- (void)setSubject:(OFString*)subject
{
	camel_mime_message_set_subject([self MIMEMESSAGE], [subject UTF8String]);
}


@end