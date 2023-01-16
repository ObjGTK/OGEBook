/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceExtension.h"

#import "OGESource.h"

@implementation OGESourceExtension

- (ESourceExtension*)SOURCEEXTENSION
{
	return E_SOURCE_EXTENSION([self GOBJECT]);
}

- (OGESource*)source
{
	return [[[OGESource alloc] initWithGObject:(GObject*)e_source_extension_get_source([self SOURCEEXTENSION])] autorelease];
}

- (void)propertyLock
{
	e_source_extension_property_lock([self SOURCEEXTENSION]);
}

- (void)propertyUnlock
{
	e_source_extension_property_unlock([self SOURCEEXTENSION]);
}

- (OGESource*)refSource
{
	return [[[OGESource alloc] initWithGObject:(GObject*)e_source_extension_ref_source([self SOURCEEXTENSION])] autorelease];
}


@end