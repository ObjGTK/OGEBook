/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSaslGssapi.h"

@implementation OGCamelSaslGssapi

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_SASL_GSSAPI;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (bool)isAvailable
{
	bool returnValue = (bool)camel_sasl_gssapi_is_available();

	return returnValue;
}

- (CamelSaslGssapi*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelSaslGssapi, CamelSaslGssapi);
}

- (void)overrideHostAndUser:(OFString*)overrideHost overrideUser:(OFString*)overrideUser
{
	camel_sasl_gssapi_override_host_and_user([self castedGObject], [overrideHost UTF8String], [overrideUser UTF8String]);
}


@end