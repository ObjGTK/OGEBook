/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceUoa.h"

@implementation OGESourceUoa

- (ESourceUoa*)SOURCEUOA
{
	return E_SOURCE_UOA([self GOBJECT]);
}

- (guint)accountId
{
	return e_source_uoa_get_account_id([self SOURCEUOA]);
}

- (void)setAccountId:(guint)accountId
{
	e_source_uoa_set_account_id([self SOURCEUOA], accountId);
}


@end