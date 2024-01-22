/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMessageInfoBase.h"

@implementation OGCamelMessageInfoBase

- (CamelMessageInfoBase*)castedGObject
{
	return CAMEL_MESSAGE_INFO_BASE([self gObject]);
}


@end