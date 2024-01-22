/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEOAuth2ServiceOutlook.h"

@implementation OGEOAuth2ServiceOutlook

- (EOAuth2ServiceOutlook*)castedGObject
{
	return E_OAUTH2_SERVICE_OUTLOOK([self gObject]);
}


@end