/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEOAuth2ServiceBase.h"

@implementation OGEOAuth2ServiceBase

- (EOAuth2ServiceBase*)castedGObject
{
	return E_OAUTH2_SERVICE_BASE([self gObject]);
}


@end