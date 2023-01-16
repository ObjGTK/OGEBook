/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceResource.h"

@implementation OGESourceResource

- (ESourceResource*)SOURCERESOURCE
{
	return E_SOURCE_RESOURCE([self GOBJECT]);
}

- (OFString*)dupIdentity
{
	return [OFString stringWithUTF8String:e_source_resource_dup_identity([self SOURCERESOURCE])];
}

- (OFString*)identity
{
	return [OFString stringWithUTF8String:e_source_resource_get_identity([self SOURCERESOURCE])];
}

- (void)setIdentity:(OFString*)identity
{
	e_source_resource_set_identity([self SOURCERESOURCE], [identity UTF8String]);
}


@end