/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEDestination.h"

#import "OGEBookClient.h"
#import <OGEBookContacts/OGEContact.h>

@implementation OGEDestination

+ (OFString*)exportv:(EDestination**)destv
{
	return [OFString stringWithUTF8String:e_destination_exportv(destv)];
}

+ (void)freev:(EDestination**)destv
{
	e_destination_freev(destv);
}

+ (OFString*)textrepv:(EDestination**)destv
{
	return [OFString stringWithUTF8String:e_destination_get_textrepv(destv)];
}

+ (OGEDestination*)import:(OFString*)str
{
	return [[[OGEDestination alloc] initWithGObject:(GObject*)e_destination_import([str UTF8String])] autorelease];
}

+ (EDestination**)importv:(OFString*)str
{
	return e_destination_importv([str UTF8String]);
}

- (instancetype)init
{
	self = [super initWithGObject:(GObject*)e_destination_new()];

	return self;
}

- (EDestination*)DESTINATION
{
	return E_DESTINATION([self GOBJECT]);
}

- (OGEDestination*)copy
{
	return [[[OGEDestination alloc] initWithGObject:(GObject*)e_destination_copy([self DESTINATION])] autorelease];
}

- (bool)empty
{
	return e_destination_empty([self DESTINATION]);
}

- (bool)equal:(const EDestination*)b
{
	return e_destination_equal([self DESTINATION], b);
}

- (OFString*)export
{
	return [OFString stringWithUTF8String:e_destination_export([self DESTINATION])];
}

- (void)exportToVcardAttribute:(EVCardAttribute*)attr
{
	e_destination_export_to_vcard_attribute([self DESTINATION], attr);
}

- (OFString*)address
{
	return [OFString stringWithUTF8String:e_destination_get_address([self DESTINATION])];
}

- (OGEContact*)contact
{
	return [[[OGEContact alloc] initWithGObject:(GObject*)e_destination_get_contact([self DESTINATION])] autorelease];
}

- (OFString*)contactUid
{
	return [OFString stringWithUTF8String:e_destination_get_contact_uid([self DESTINATION])];
}

- (OFString*)email
{
	return [OFString stringWithUTF8String:e_destination_get_email([self DESTINATION])];
}

- (gint)emailNum
{
	return e_destination_get_email_num([self DESTINATION]);
}

- (bool)htmlMailPref
{
	return e_destination_get_html_mail_pref([self DESTINATION]);
}

- (OFString*)name
{
	return [OFString stringWithUTF8String:e_destination_get_name([self DESTINATION])];
}

- (OFString*)sourceUid
{
	return [OFString stringWithUTF8String:e_destination_get_source_uid([self DESTINATION])];
}

- (OFString*)textrep:(bool)includeEmail
{
	return [OFString stringWithUTF8String:e_destination_get_textrep([self DESTINATION], includeEmail)];
}

- (bool)isAutoRecipient
{
	return e_destination_is_auto_recipient([self DESTINATION]);
}

- (bool)isEvolutionList
{
	return e_destination_is_evolution_list([self DESTINATION]);
}

- (bool)isIgnored
{
	return e_destination_is_ignored([self DESTINATION]);
}

- (const GList*)listGetDests
{
	return e_destination_list_get_dests([self DESTINATION]);
}

- (const GList*)listGetRootDests
{
	return e_destination_list_get_root_dests([self DESTINATION]);
}

- (bool)listShowAddresses
{
	return e_destination_list_show_addresses([self DESTINATION]);
}

- (void)setAutoRecipient:(bool)value
{
	e_destination_set_auto_recipient([self DESTINATION], value);
}

- (void)setClient:(OGEBookClient*)client
{
	e_destination_set_client([self DESTINATION], [client BOOKCLIENT]);
}

- (void)setContactWithContact:(OGEContact*)contact emailNum:(gint)emailNum
{
	e_destination_set_contact([self DESTINATION], [contact CONTACT], emailNum);
}

- (void)setContactUidWithUid:(OFString*)uid emailNum:(gint)emailNum
{
	e_destination_set_contact_uid([self DESTINATION], [uid UTF8String], emailNum);
}

- (void)setEmail:(OFString*)email
{
	e_destination_set_email([self DESTINATION], [email UTF8String]);
}

- (void)setHtmlMailPref:(bool)flag
{
	e_destination_set_html_mail_pref([self DESTINATION], flag);
}

- (void)setIgnored:(bool)ignored
{
	e_destination_set_ignored([self DESTINATION], ignored);
}

- (void)setName:(OFString*)name
{
	e_destination_set_name([self DESTINATION], [name UTF8String]);
}

- (void)setRaw:(OFString*)raw
{
	e_destination_set_raw([self DESTINATION], [raw UTF8String]);
}


@end