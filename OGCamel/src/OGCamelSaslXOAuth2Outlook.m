/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSaslXOAuth2Outlook.h"

@implementation OGCamelSaslXOAuth2Outlook

- (CamelSaslXOAuth2Outlook*)SASLXOAUTH2OUTLOOK
{
	return CAMEL_SASL_XOAUTH2_OUTLOOK([self GOBJECT]);
}


@end