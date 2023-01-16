/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceCalendar.h"

@implementation OGESourceCalendar

- (ESourceCalendar*)SOURCECALENDAR
{
	return E_SOURCE_CALENDAR([self GOBJECT]);
}


@end