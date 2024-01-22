/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceOffline.h"

@implementation OGESourceOffline

- (ESourceOffline*)castedGObject
{
	return E_SOURCE_OFFLINE([self gObject]);
}

- (bool)staySynchronized
{
	bool returnValue = e_source_offline_get_stay_synchronized([self castedGObject]);

	return returnValue;
}

- (void)setStaySynchronized:(bool)staySynchronized
{
	e_source_offline_set_stay_synchronized([self castedGObject], staySynchronized);
}


@end