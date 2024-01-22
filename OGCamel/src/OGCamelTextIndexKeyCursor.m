/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelTextIndexKeyCursor.h"

@implementation OGCamelTextIndexKeyCursor

- (CamelTextIndexKeyCursor*)castedGObject
{
	return CAMEL_TEXT_INDEX_KEY_CURSOR([self gObject]);
}


@end