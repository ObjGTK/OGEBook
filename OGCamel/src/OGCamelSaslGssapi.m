/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSaslGssapi.h"

@implementation OGCamelSaslGssapi

+ (bool)isAvailable
{
	return camel_sasl_gssapi_is_available();
}

- (CamelSaslGssapi*)SASLGSSAPI
{
	return CAMEL_SASL_GSSAPI([self GOBJECT]);
}

- (void)overrideHostAndUserWithOverrideHost:(OFString*)overrideHost overrideUser:(OFString*)overrideUser
{
	camel_sasl_gssapi_override_host_and_user([self SASLGSSAPI], [overrideHost UTF8String], [overrideUser UTF8String]);
}


@end