/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelGpgContext.h"

#import "OGCamelSession.h"

@implementation OGCamelGpgContext

- (instancetype)init:(OGCamelSession*)session
{
	self = [super initWithGObject:(GObject*)camel_gpg_context_new([session SESSION])];

	return self;
}

- (CamelGpgContext*)GPGCONTEXT
{
	return CAMEL_GPG_CONTEXT([self GOBJECT]);
}

- (bool)alwaysTrust
{
	return camel_gpg_context_get_always_trust([self GPGCONTEXT]);
}

- (bool)preferInline
{
	return camel_gpg_context_get_prefer_inline([self GPGCONTEXT]);
}

- (void)setAlwaysTrust:(bool)alwaysTrust
{
	camel_gpg_context_set_always_trust([self GPGCONTEXT], alwaysTrust);
}

- (void)setPreferInline:(bool)preferInline
{
	camel_gpg_context_set_prefer_inline([self GPGCONTEXT], preferInline);
}


@end