/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelCipherContext.h"

@class OGCamelMimePart;
@class OGCamelSession;

@interface OGCamelSMIMEContext : OGCamelCipherContext
{

}


/**
 * Constructors
 */
- (instancetype)init:(OGCamelSession*)session;

/**
 * Methods
 */

- (CamelSMIMEContext*)castedGObject;

/**
 *
 * @param part
 * @return
 */
- (guint32)describePart:(OGCamelMimePart*)part;

/**
 *
 * @param use
 * @param key
 */
- (void)setEncryptKeyWithUse:(bool)use key:(OFString*)key;

/**
 *
 * @param type
 */
- (void)setSignMode:(CamelSMIMESign)type;

@end