/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMessageInfoBase.h"

@implementation OGCamelMessageInfoBase

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_MESSAGE_INFO_BASE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (CamelMessageInfoBase*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelMessageInfoBase, CamelMessageInfoBase);
}


@end