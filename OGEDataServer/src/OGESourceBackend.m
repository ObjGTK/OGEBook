/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceBackend.h"

@implementation OGESourceBackend

- (ESourceBackend*)SOURCEBACKEND
{
	return E_SOURCE_BACKEND([self GOBJECT]);
}

- (OFString*)dupBackendName
{
	return [OFString stringWithUTF8String:e_source_backend_dup_backend_name([self SOURCEBACKEND])];
}

- (OFString*)backendName
{
	return [OFString stringWithUTF8String:e_source_backend_get_backend_name([self SOURCEBACKEND])];
}

- (void)setBackendName:(OFString*)backendName
{
	e_source_backend_set_backend_name([self SOURCEBACKEND], [backendName UTF8String]);
}


@end