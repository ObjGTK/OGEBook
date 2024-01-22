/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSaslGssapi.h"

@implementation OGCamelSaslGssapi

+ (bool)isAvailable
{
	bool returnValue = camel_sasl_gssapi_is_available();

	return returnValue;
}

- (CamelSaslGssapi*)castedGObject
{
	return CAMEL_SASL_GSSAPI([self gObject]);
}

- (void)overrideHostAndUserWithOverrideHost:(OFString*)overrideHost overrideUser:(OFString*)overrideUser
{
	camel_sasl_gssapi_override_host_and_user([self castedGObject], [overrideHost UTF8String], [overrideUser UTF8String]);
}


@end