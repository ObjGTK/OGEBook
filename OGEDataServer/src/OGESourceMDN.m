/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceMDN.h"

@implementation OGESourceMDN

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_SOURCE_MDN;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (ESourceMDN*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceMDN, ESourceMDN);
}

- (EMdnResponsePolicy)responsePolicy
{
	EMdnResponsePolicy returnValue = (EMdnResponsePolicy)e_source_mdn_get_response_policy([self castedGObject]);

	return returnValue;
}

- (void)setResponsePolicy:(EMdnResponsePolicy)responsePolicy
{
	e_source_mdn_set_response_policy([self castedGObject], responsePolicy);
}


@end