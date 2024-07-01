/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEDestination.h"

#import "OGEBookClient.h"
#import <OGEBookContacts/OGEContact.h>

@implementation OGEDestination

+ (OFString*)exportv:(EDestination**)destv
{
	gchar* gobjectValue = e_destination_exportv(destv);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

+ (void)freev:(EDestination**)destv
{
	e_destination_freev(destv);
}

+ (OFString*)textrepv:(EDestination**)destv
{
	gchar* gobjectValue = e_destination_get_textrepv(destv);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

+ (OGEDestination*)import:(OFString*)str
{
	EDestination* gobjectValue = E_DESTINATION(e_destination_import([str UTF8String]));

	OGEDestination* returnValue = [OGEDestination withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

+ (EDestination**)importv:(OFString*)str
{
	EDestination** returnValue = e_destination_importv([str UTF8String]);

	return returnValue;
}

- (instancetype)init
{
	EDestination* gobjectValue = E_DESTINATION(e_destination_new());

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

- (EDestination*)castedGObject
{
	return E_DESTINATION([self gObject]);
}

- (OGEDestination*)copy
{
	EDestination* gobjectValue = E_DESTINATION(e_destination_copy([self castedGObject]));

	OGEDestination* returnValue = [OGEDestination withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (bool)empty
{
	bool returnValue = e_destination_empty([self castedGObject]);

	return returnValue;
}

- (bool)equal:(const EDestination*)b
{
	bool returnValue = e_destination_equal([self castedGObject], b);

	return returnValue;
}

- (OFString*)export
{
	gchar* gobjectValue = e_destination_export([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (void)exportToVcardAttribute:(EVCardAttribute*)attr
{
	e_destination_export_to_vcard_attribute([self castedGObject], attr);
}

- (OFString*)address
{
	const gchar* gobjectValue = e_destination_get_address([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGEContact*)contact
{
	EContact* gobjectValue = E_CONTACT(e_destination_get_contact([self castedGObject]));

	OGEContact* returnValue = [OGEContact withGObject:gobjectValue];
	return returnValue;
}

- (OFString*)contactUid
{
	const gchar* gobjectValue = e_destination_get_contact_uid([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)email
{
	const gchar* gobjectValue = e_destination_get_email([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (gint)emailNum
{
	gint returnValue = e_destination_get_email_num([self castedGObject]);

	return returnValue;
}

- (bool)htmlMailPref
{
	bool returnValue = e_destination_get_html_mail_pref([self castedGObject]);

	return returnValue;
}

- (OFString*)name
{
	const gchar* gobjectValue = e_destination_get_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)sourceUid
{
	const gchar* gobjectValue = e_destination_get_source_uid([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)textrep:(bool)includeEmail
{
	const gchar* gobjectValue = e_destination_get_textrep([self castedGObject], includeEmail);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)isAutoRecipient
{
	bool returnValue = e_destination_is_auto_recipient([self castedGObject]);

	return returnValue;
}

- (bool)isEvolutionList
{
	bool returnValue = e_destination_is_evolution_list([self castedGObject]);

	return returnValue;
}

- (bool)isIgnored
{
	bool returnValue = e_destination_is_ignored([self castedGObject]);

	return returnValue;
}

- (const GList*)listGetDests
{
	const GList* returnValue = e_destination_list_get_dests([self castedGObject]);

	return returnValue;
}

- (const GList*)listGetRootDests
{
	const GList* returnValue = e_destination_list_get_root_dests([self castedGObject]);

	return returnValue;
}

- (bool)listShowAddresses
{
	bool returnValue = e_destination_list_show_addresses([self castedGObject]);

	return returnValue;
}

- (void)setAutoRecipient:(bool)value
{
	e_destination_set_auto_recipient([self castedGObject], value);
}

- (void)setClient:(OGEBookClient*)client
{
	e_destination_set_client([self castedGObject], [client castedGObject]);
}

- (void)setContactWithContact:(OGEContact*)contact emailNum:(gint)emailNum
{
	e_destination_set_contact([self castedGObject], [contact castedGObject], emailNum);
}

- (void)setContactUidWithUid:(OFString*)uid emailNum:(gint)emailNum
{
	e_destination_set_contact_uid([self castedGObject], [uid UTF8String], emailNum);
}

- (void)setEmail:(OFString*)email
{
	e_destination_set_email([self castedGObject], [email UTF8String]);
}

- (void)setHtmlMailPref:(bool)flag
{
	e_destination_set_html_mail_pref([self castedGObject], flag);
}

- (void)setIgnored:(bool)ignored
{
	e_destination_set_ignored([self castedGObject], ignored);
}

- (void)setName:(OFString*)name
{
	e_destination_set_name([self castedGObject], [name UTF8String]);
}

- (void)setRaw:(OFString*)raw
{
	e_destination_set_raw([self castedGObject], [raw UTF8String]);
}


@end