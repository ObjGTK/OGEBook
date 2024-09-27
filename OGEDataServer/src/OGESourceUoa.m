/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceUoa.h"

@implementation OGESourceUoa

- (ESourceUoa*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceUoa, ESourceUoa);
}

- (guint)accountId
{
	guint returnValue = e_source_uoa_get_account_id([self castedGObject]);

	return returnValue;
}

- (void)setAccountId:(guint)accountId
{
	e_source_uoa_set_account_id([self castedGObject], accountId);
}


@end