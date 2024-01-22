/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSaslXOAuth2Yahoo.h"

@implementation OGCamelSaslXOAuth2Yahoo

- (CamelSaslXOAuth2Yahoo*)castedGObject
{
	return CAMEL_SASL_XOAUTH2_YAHOO([self gObject]);
}


@end