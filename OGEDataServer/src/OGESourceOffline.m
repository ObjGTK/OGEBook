/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceOffline.h"

@implementation OGESourceOffline

- (ESourceOffline*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceOffline, ESourceOffline);
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