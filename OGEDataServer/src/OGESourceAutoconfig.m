/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceAutoconfig.h"

@implementation OGESourceAutoconfig

- (ESourceAutoconfig*)SOURCEAUTOCONFIG
{
	return E_SOURCE_AUTOCONFIG([self GOBJECT]);
}

- (OFString*)dupRevision
{
	return [OFString stringWithUTF8String:e_source_autoconfig_dup_revision([self SOURCEAUTOCONFIG])];
}

- (OFString*)revision
{
	return [OFString stringWithUTF8String:e_source_autoconfig_get_revision([self SOURCEAUTOCONFIG])];
}

- (void)setRevision:(OFString*)revision
{
	e_source_autoconfig_set_revision([self SOURCEAUTOCONFIG], [revision UTF8String]);
}


@end