/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceAlarms.h"

@implementation OGESourceAlarms

- (ESourceAlarms*)SOURCEALARMS
{
	return E_SOURCE_ALARMS([self GOBJECT]);
}

- (OFString*)dupLastNotified
{
	return [OFString stringWithUTF8String:e_source_alarms_dup_last_notified([self SOURCEALARMS])];
}

- (bool)includeMe
{
	return e_source_alarms_get_include_me([self SOURCEALARMS]);
}

- (OFString*)lastNotified
{
	return [OFString stringWithUTF8String:e_source_alarms_get_last_notified([self SOURCEALARMS])];
}

- (void)setIncludeMe:(bool)includeMe
{
	e_source_alarms_set_include_me([self SOURCEALARMS], includeMe);
}

- (void)setLastNotified:(OFString*)lastNotified
{
	e_source_alarms_set_last_notified([self SOURCEALARMS], [lastNotified UTF8String]);
}


@end