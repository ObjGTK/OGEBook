/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSaslXOAuth2Google.h"

@implementation OGCamelSaslXOAuth2Google

- (CamelSaslXOAuth2Google*)SASLXOAUTH2GOOGLE
{
	return CAMEL_SASL_XOAUTH2_GOOGLE([self GOBJECT]);
}


@end