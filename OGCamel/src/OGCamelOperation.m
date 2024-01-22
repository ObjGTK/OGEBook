/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelOperation.h"

#import <OGio/OGCancellable.h>

@implementation OGCamelOperation

+ (void)cancelAll
{
	camel_operation_cancel_all();
}

+ (void)popMessage:(OGCancellable*)cancellable
{
	camel_operation_pop_message([cancellable castedGObject]);
}

+ (void)progressWithCancellable:(OGCancellable*)cancellable percent:(gint)percent
{
	camel_operation_progress([cancellable castedGObject], percent);
}

- (instancetype)init
{
	CamelOperation* gobjectValue = CAMEL_OPERATION(camel_operation_new());

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

- (instancetype)initProxy:(OGCancellable*)cancellable
{
	CamelOperation* gobjectValue = CAMEL_OPERATION(camel_operation_new_proxy([cancellable castedGObject]));

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

- (CamelOperation*)castedGObject
{
	return CAMEL_OPERATION([self gObject]);
}


@end