/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEOAuth2ServiceBase.h"

@implementation OGEOAuth2ServiceBase

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_OAUTH2_SERVICE_BASE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (EOAuth2ServiceBase*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], EOAuth2ServiceBase, EOAuth2ServiceBase);
}


@end