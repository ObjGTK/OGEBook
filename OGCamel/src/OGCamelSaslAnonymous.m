/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSaslAnonymous.h"

@implementation OGCamelSaslAnonymous

- (instancetype)initWithType:(CamelSaslAnonTraceType)type traceInfo:(OFString*)traceInfo
{
	CamelSaslAnonymous* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_sasl_anonymous_new(type, [traceInfo UTF8String]), CamelSaslAnonymous, CamelSaslAnonymous);

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

- (CamelSaslAnonymous*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelSaslAnonymous, CamelSaslAnonymous);
}


@end