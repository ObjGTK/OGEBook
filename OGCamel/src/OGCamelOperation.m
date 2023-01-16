/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelOperation.h"

@implementation OGCamelOperation

+ (void)cancelAll
{
	camel_operation_cancel_all();
}

+ (void)popMessage:(GCancellable*)cancellable
{
	camel_operation_pop_message(cancellable);
}

+ (void)progressWithCancellable:(GCancellable*)cancellable percent:(gint)percent
{
	camel_operation_progress(cancellable, percent);
}

- (instancetype)init
{
	self = [super initWithGObject:(GObject*)camel_operation_new()];

	return self;
}

- (instancetype)initProxy:(GCancellable*)cancellable
{
	self = [super initWithGObject:(GObject*)camel_operation_new_proxy(cancellable)];

	return self;
}

- (CamelOperation*)OPERATION
{
	return CAMEL_OPERATION([self GOBJECT]);
}


@end