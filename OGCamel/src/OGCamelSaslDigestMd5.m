/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSaslDigestMd5.h"

@implementation OGCamelSaslDigestMd5

- (CamelSaslDigestMd5*)SASLDIGESTMD5
{
	return CAMEL_SASL_DIGEST_MD5([self GOBJECT]);
}


@end