/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceGoa.h"

@implementation OGESourceGoa

- (ESourceGoa*)SOURCEGOA
{
	return E_SOURCE_GOA([self GOBJECT]);
}

- (OFString*)dupAccountId
{
	return [OFString stringWithUTF8String:e_source_goa_dup_account_id([self SOURCEGOA])];
}

- (OFString*)dupAddress
{
	return [OFString stringWithUTF8String:e_source_goa_dup_address([self SOURCEGOA])];
}

- (OFString*)dupCalendarUrl
{
	return [OFString stringWithUTF8String:e_source_goa_dup_calendar_url([self SOURCEGOA])];
}

- (OFString*)dupContactsUrl
{
	return [OFString stringWithUTF8String:e_source_goa_dup_contacts_url([self SOURCEGOA])];
}

- (OFString*)dupName
{
	return [OFString stringWithUTF8String:e_source_goa_dup_name([self SOURCEGOA])];
}

- (OFString*)accountId
{
	return [OFString stringWithUTF8String:e_source_goa_get_account_id([self SOURCEGOA])];
}

- (OFString*)address
{
	return [OFString stringWithUTF8String:e_source_goa_get_address([self SOURCEGOA])];
}

- (OFString*)calendarUrl
{
	return [OFString stringWithUTF8String:e_source_goa_get_calendar_url([self SOURCEGOA])];
}

- (OFString*)contactsUrl
{
	return [OFString stringWithUTF8String:e_source_goa_get_contacts_url([self SOURCEGOA])];
}

- (OFString*)name
{
	return [OFString stringWithUTF8String:e_source_goa_get_name([self SOURCEGOA])];
}

- (void)setAccountId:(OFString*)accountId
{
	e_source_goa_set_account_id([self SOURCEGOA], [accountId UTF8String]);
}

- (void)setAddress:(OFString*)address
{
	e_source_goa_set_address([self SOURCEGOA], [address UTF8String]);
}

- (void)setCalendarUrl:(OFString*)calendarUrl
{
	e_source_goa_set_calendar_url([self SOURCEGOA], [calendarUrl UTF8String]);
}

- (void)setContactsUrl:(OFString*)contactsUrl
{
	e_source_goa_set_contacts_url([self SOURCEGOA], [contactsUrl UTF8String]);
}

- (void)setName:(OFString*)name
{
	e_source_goa_set_name([self SOURCEGOA], [name UTF8String]);
}


@end