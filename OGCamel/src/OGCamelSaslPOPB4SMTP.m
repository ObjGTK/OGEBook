/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSaslPOPB4SMTP.h"

@implementation OGCamelSaslPOPB4SMTP

- (CamelSaslPOPB4SMTP*)SASLPOPB4SMTP
{
	return CAMEL_SASL_POPB4SMTP([self GOBJECT]);
}


@end