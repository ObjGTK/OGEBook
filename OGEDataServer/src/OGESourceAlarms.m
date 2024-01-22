/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceAlarms.h"

@implementation OGESourceAlarms

- (ESourceAlarms*)castedGObject
{
	return E_SOURCE_ALARMS([self gObject]);
}

- (OFString*)dupLastNotified
{
	gchar* gobjectValue = e_source_alarms_dup_last_notified([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (bool)includeMe
{
	bool returnValue = e_source_alarms_get_include_me([self castedGObject]);

	return returnValue;
}

- (OFString*)lastNotified
{
	const gchar* gobjectValue = e_source_alarms_get_last_notified([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setIncludeMe:(bool)includeMe
{
	e_source_alarms_set_include_me([self castedGObject], includeMe);
}

- (void)setLastNotified:(OFString*)lastNotified
{
	e_source_alarms_set_last_notified([self castedGObject], [lastNotified UTF8String]);
}


@end