/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceLocal.h"

@implementation OGESourceLocal

- (ESourceLocal*)SOURCELOCAL
{
	return E_SOURCE_LOCAL([self GOBJECT]);
}

- (GFile*)dupCustomFile
{
	return e_source_local_dup_custom_file([self SOURCELOCAL]);
}

- (GFile*)customFile
{
	return e_source_local_get_custom_file([self SOURCELOCAL]);
}

- (bool)writable
{
	return e_source_local_get_writable([self SOURCELOCAL]);
}

- (void)setCustomFile:(GFile*)customFile
{
	e_source_local_set_custom_file([self SOURCELOCAL], customFile);
}

- (void)setWritable:(bool)writable
{
	e_source_local_set_writable([self SOURCELOCAL], writable);
}


@end