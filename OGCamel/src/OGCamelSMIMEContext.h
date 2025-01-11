/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelCipherContext.h"

@class OGCamelMimePart;
@class OGCamelSession;

@interface OGCamelSMIMEContext : OGCamelCipherContext
{

}

/**
 * Functions
 */
+ (void)load;


/**
 * Utility function to get a localized text description for an error code
 * returned by PORT_GetError().
 * 
 * Note: the function returns always NULL when the library was not compiled
 *   with S/MIME support.
 *
 * @param nssErrorCode an error code, as returned by PORT_GetError()
 * @return a localized text description of the @nss_error_code,
 *    or NULL, when the code is unknown or the library was not compiled with
 *    S/MIME support.
 */
+ (OFString*)utilNssErrorToString:(gint)nssErrorCode;

/**
 * Constructors
 */
+ (instancetype)sMIMEContext:(OGCamelSession*)session;

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