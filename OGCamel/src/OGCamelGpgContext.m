/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelGpgContext.h"

#import "OGCamelSession.h"

@implementation OGCamelGpgContext

- (instancetype)init:(OGCamelSession*)session
{
	CamelGpgContext* gobjectValue = CAMEL_GPG_CONTEXT(camel_gpg_context_new([session castedGObject]));

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (CamelGpgContext*)castedGObject
{
	return CAMEL_GPG_CONTEXT([self gObject]);
}

- (bool)alwaysTrust
{
	bool returnValue = camel_gpg_context_get_always_trust([self castedGObject]);

	return returnValue;
}

- (bool)locateKeys
{
	bool returnValue = camel_gpg_context_get_locate_keys([self castedGObject]);

	return returnValue;
}

- (bool)preferInline
{
	bool returnValue = camel_gpg_context_get_prefer_inline([self castedGObject]);

	return returnValue;
}

- (void)setAlwaysTrust:(bool)alwaysTrust
{
	camel_gpg_context_set_always_trust([self castedGObject], alwaysTrust);
}

- (void)setLocateKeys:(bool)locateKeys
{
	camel_gpg_context_set_locate_keys([self castedGObject], locateKeys);
}

- (void)setPreferInline:(bool)preferInline
{
	camel_gpg_context_set_prefer_inline([self castedGObject], preferInline);
}


@end