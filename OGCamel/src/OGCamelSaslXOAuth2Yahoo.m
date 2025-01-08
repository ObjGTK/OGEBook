/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSaslXOAuth2Yahoo.h"

@implementation OGCamelSaslXOAuth2Yahoo

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_SASL_XOAUTH2_YAHOO;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (CamelSaslXOAuth2Yahoo*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelSaslXOAuth2Yahoo, CamelSaslXOAuth2Yahoo);
}


@end