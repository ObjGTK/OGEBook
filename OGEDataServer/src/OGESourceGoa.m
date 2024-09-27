/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceGoa.h"

@implementation OGESourceGoa

- (ESourceGoa*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceGoa, ESourceGoa);
}

- (OFString*)dupAccountId
{
	gchar* gobjectValue = e_source_goa_dup_account_id([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupAddress
{
	gchar* gobjectValue = e_source_goa_dup_address([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupCalendarUrl
{
	gchar* gobjectValue = e_source_goa_dup_calendar_url([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupContactsUrl
{
	gchar* gobjectValue = e_source_goa_dup_contacts_url([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupName
{
	gchar* gobjectValue = e_source_goa_dup_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)accountId
{
	const gchar* gobjectValue = e_source_goa_get_account_id([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)address
{
	const gchar* gobjectValue = e_source_goa_get_address([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)calendarUrl
{
	const gchar* gobjectValue = e_source_goa_get_calendar_url([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)contactsUrl
{
	const gchar* gobjectValue = e_source_goa_get_contacts_url([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)name
{
	const gchar* gobjectValue = e_source_goa_get_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setAccountId:(OFString*)accountId
{
	e_source_goa_set_account_id([self castedGObject], [accountId UTF8String]);
}

- (void)setAddress:(OFString*)address
{
	e_source_goa_set_address([self castedGObject], [address UTF8String]);
}

- (void)setCalendarUrl:(OFString*)calendarUrl
{
	e_source_goa_set_calendar_url([self castedGObject], [calendarUrl UTF8String]);
}

- (void)setContactsUrl:(OFString*)contactsUrl
{
	e_source_goa_set_contacts_url([self castedGObject], [contactsUrl UTF8String]);
}

- (void)setName:(OFString*)name
{
	e_source_goa_set_name([self castedGObject], [name UTF8String]);
}


@end