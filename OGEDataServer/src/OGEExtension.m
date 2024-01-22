/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEExtension.h"

@implementation OGEExtension

- (EExtension*)castedGObject
{
	return E_EXTENSION([self gObject]);
}

- (EExtensible*)extensible
{
	EExtensible* returnValue = e_extension_get_extensible([self castedGObject]);

	return returnValue;
}


@end