/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceMDN.h"

@implementation OGESourceMDN

- (ESourceMDN*)castedGObject
{
	return E_SOURCE_MDN([self gObject]);
}

- (EMdnResponsePolicy)responsePolicy
{
	EMdnResponsePolicy returnValue = e_source_mdn_get_response_policy([self castedGObject]);

	return returnValue;
}

- (void)setResponsePolicy:(EMdnResponsePolicy)responsePolicy
{
	e_source_mdn_set_response_policy([self castedGObject], responsePolicy);
}


@end