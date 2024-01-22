/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEOAuth2ServiceYahoo.h"

@implementation OGEOAuth2ServiceYahoo

- (EOAuth2ServiceYahoo*)castedGObject
{
	return E_OAUTH2_SERVICE_YAHOO([self gObject]);
}


@end