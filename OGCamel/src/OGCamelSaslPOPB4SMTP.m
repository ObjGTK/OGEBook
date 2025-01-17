/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSaslPOPB4SMTP.h"

@implementation OGCamelSaslPOPB4SMTP

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_SASL_POPB4SMTP;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (CamelSaslPOPB4SMTP*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelSaslPOPB4SMTP, CamelSaslPOPB4SMTP);
}


@end