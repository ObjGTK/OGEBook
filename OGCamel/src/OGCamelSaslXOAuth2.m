/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSaslXOAuth2.h"

@implementation OGCamelSaslXOAuth2

- (CamelSaslXOAuth2*)SASLXOAUTH2
{
	return CAMEL_SASL_XOAUTH2([self GOBJECT]);
}


@end