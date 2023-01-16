/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSaslAnonymous.h"

@implementation OGCamelSaslAnonymous

- (instancetype)initWithType:(CamelSaslAnonTraceType)type traceInfo:(OFString*)traceInfo
{
	self = [super initWithGObject:(GObject*)camel_sasl_anonymous_new(type, [traceInfo UTF8String])];

	return self;
}

- (CamelSaslAnonymous*)SASLANONYMOUS
{
	return CAMEL_SASL_ANONYMOUS([self GOBJECT]);
}


@end