/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceCollection.h"

@implementation OGESourceCollection

- (ESourceCollection*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceCollection, ESourceCollection);
}

- (OFString*)dupCalendarUrl
{
	gchar* gobjectValue = e_source_collection_dup_calendar_url([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupContactsUrl
{
	gchar* gobjectValue = e_source_collection_dup_contacts_url([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupIdentity
{
	gchar* gobjectValue = e_source_collection_dup_identity([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (bool)allowSourcesRename
{
	bool returnValue = e_source_collection_get_allow_sources_rename([self castedGObject]);

	return returnValue;
}

- (bool)calendarEnabled
{
	bool returnValue = e_source_collection_get_calendar_enabled([self castedGObject]);

	return returnValue;
}

- (OFString*)calendarUrl
{
	const gchar* gobjectValue = e_source_collection_get_calendar_url([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)contactsEnabled
{
	bool returnValue = e_source_collection_get_contacts_enabled([self castedGObject]);

	return returnValue;
}

- (OFString*)contactsUrl
{
	const gchar* gobjectValue = e_source_collection_get_contacts_url([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)identity
{
	const gchar* gobjectValue = e_source_collection_get_identity([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)mailEnabled
{
	bool returnValue = e_source_collection_get_mail_enabled([self castedGObject]);

	return returnValue;
}

- (void)setAllowSourcesRename:(bool)allowSourcesRename
{
	e_source_collection_set_allow_sources_rename([self castedGObject], allowSourcesRename);
}

- (void)setCalendarEnabled:(bool)calendarEnabled
{
	e_source_collection_set_calendar_enabled([self castedGObject], calendarEnabled);
}

- (void)setCalendarUrl:(OFString*)calendarUrl
{
	e_source_collection_set_calendar_url([self castedGObject], [calendarUrl UTF8String]);
}

- (void)setContactsEnabled:(bool)contactsEnabled
{
	e_source_collection_set_contacts_enabled([self castedGObject], contactsEnabled);
}

- (void)setContactsUrl:(OFString*)contactsUrl
{
	e_source_collection_set_contacts_url([self castedGObject], [contactsUrl UTF8String]);
}

- (void)setIdentity:(OFString*)identity
{
	e_source_collection_set_identity([self castedGObject], [identity UTF8String]);
}

- (void)setMailEnabled:(bool)mailEnabled
{
	e_source_collection_set_mail_enabled([self castedGObject], mailEnabled);
}


@end