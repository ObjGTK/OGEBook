/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceMDN.h"

@implementation OGESourceMDN

- (ESourceMDN*)SOURCEMDN
{
	return E_SOURCE_MDN([self GOBJECT]);
}

- (EMdnResponsePolicy)responsePolicy
{
	return e_source_mdn_get_response_policy([self SOURCEMDN]);
}

- (void)setResponsePolicy:(EMdnResponsePolicy)responsePolicy
{
	e_source_mdn_set_response_policy([self SOURCEMDN], responsePolicy);
}


@end