/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceOffline.h"

@implementation OGESourceOffline

- (ESourceOffline*)SOURCEOFFLINE
{
	return E_SOURCE_OFFLINE([self GOBJECT]);
}

- (bool)staySynchronized
{
	return e_source_offline_get_stay_synchronized([self SOURCEOFFLINE]);
}

- (void)setStaySynchronized:(bool)staySynchronized
{
	e_source_offline_set_stay_synchronized([self SOURCEOFFLINE], staySynchronized);
}


@end