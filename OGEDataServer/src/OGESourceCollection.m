/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceCollection.h"

@implementation OGESourceCollection

- (ESourceCollection*)SOURCECOLLECTION
{
	return E_SOURCE_COLLECTION([self GOBJECT]);
}

- (OFString*)dupCalendarUrl
{
	return [OFString stringWithUTF8String:e_source_collection_dup_calendar_url([self SOURCECOLLECTION])];
}

- (OFString*)dupContactsUrl
{
	return [OFString stringWithUTF8String:e_source_collection_dup_contacts_url([self SOURCECOLLECTION])];
}

- (OFString*)dupIdentity
{
	return [OFString stringWithUTF8String:e_source_collection_dup_identity([self SOURCECOLLECTION])];
}

- (bool)allowSourcesRename
{
	return e_source_collection_get_allow_sources_rename([self SOURCECOLLECTION]);
}

- (bool)calendarEnabled
{
	return e_source_collection_get_calendar_enabled([self SOURCECOLLECTION]);
}

- (OFString*)calendarUrl
{
	return [OFString stringWithUTF8String:e_source_collection_get_calendar_url([self SOURCECOLLECTION])];
}

- (bool)contactsEnabled
{
	return e_source_collection_get_contacts_enabled([self SOURCECOLLECTION]);
}

- (OFString*)contactsUrl
{
	return [OFString stringWithUTF8String:e_source_collection_get_contacts_url([self SOURCECOLLECTION])];
}

- (OFString*)identity
{
	return [OFString stringWithUTF8String:e_source_collection_get_identity([self SOURCECOLLECTION])];
}

- (bool)mailEnabled
{
	return e_source_collection_get_mail_enabled([self SOURCECOLLECTION]);
}

- (void)setAllowSourcesRename:(bool)allowSourcesRename
{
	e_source_collection_set_allow_sources_rename([self SOURCECOLLECTION], allowSourcesRename);
}

- (void)setCalendarEnabled:(bool)calendarEnabled
{
	e_source_collection_set_calendar_enabled([self SOURCECOLLECTION], calendarEnabled);
}

- (void)setCalendarUrl:(OFString*)calendarUrl
{
	e_source_collection_set_calendar_url([self SOURCECOLLECTION], [calendarUrl UTF8String]);
}

- (void)setContactsEnabled:(bool)contactsEnabled
{
	e_source_collection_set_contacts_enabled([self SOURCECOLLECTION], contactsEnabled);
}

- (void)setContactsUrl:(OFString*)contactsUrl
{
	e_source_collection_set_contacts_url([self SOURCECOLLECTION], [contactsUrl UTF8String]);
}

- (void)setIdentity:(OFString*)identity
{
	e_source_collection_set_identity([self SOURCECOLLECTION], [identity UTF8String]);
}

- (void)setMailEnabled:(bool)mailEnabled
{
	e_source_collection_set_mail_enabled([self SOURCECOLLECTION], mailEnabled);
}


@end