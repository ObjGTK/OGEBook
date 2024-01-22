/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceMailTransport.h"

@implementation OGESourceMailTransport

- (ESourceMailTransport*)castedGObject
{
	return E_SOURCE_MAIL_TRANSPORT([self gObject]);
}


@end