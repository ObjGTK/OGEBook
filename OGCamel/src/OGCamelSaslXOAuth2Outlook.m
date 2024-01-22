/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSaslXOAuth2Outlook.h"

@implementation OGCamelSaslXOAuth2Outlook

- (CamelSaslXOAuth2Outlook*)castedGObject
{
	return CAMEL_SASL_XOAUTH2_OUTLOOK([self gObject]);
}


@end