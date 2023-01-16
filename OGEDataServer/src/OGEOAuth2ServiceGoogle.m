/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEOAuth2ServiceGoogle.h"

@implementation OGEOAuth2ServiceGoogle

- (EOAuth2ServiceGoogle*)OAUTH2SERVICEGOOGLE
{
	return E_OAUTH2_SERVICE_GOOGLE([self GOBJECT]);
}


@end