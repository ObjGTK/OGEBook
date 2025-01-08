/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterPgp.h"

@implementation OGCamelMimeFilterPgp

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_MIME_FILTER_PGP;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)init
{
	CamelMimeFilterPgp* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_mime_filter_pgp_new(), CamelMimeFilterPgp, CamelMimeFilterPgp);

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

- (CamelMimeFilterPgp*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelMimeFilterPgp, CamelMimeFilterPgp);
}


@end