/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSaslDigestMd5.h"

@implementation OGCamelSaslDigestMd5

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_SASL_DIGEST_MD5;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (CamelSaslDigestMd5*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelSaslDigestMd5, CamelSaslDigestMd5);
}


@end