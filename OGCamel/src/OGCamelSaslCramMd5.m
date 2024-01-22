/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSaslCramMd5.h"

@implementation OGCamelSaslCramMd5

- (CamelSaslCramMd5*)castedGObject
{
	return CAMEL_SASL_CRAM_MD5([self gObject]);
}


@end