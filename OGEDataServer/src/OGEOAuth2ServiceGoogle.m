/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEOAuth2ServiceGoogle.h"

@implementation OGEOAuth2ServiceGoogle

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_OAUTH2_SERVICE_GOOGLE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (EOAuth2ServiceGoogle*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], EOAuth2ServiceGoogle, EOAuth2ServiceGoogle);
}


@end