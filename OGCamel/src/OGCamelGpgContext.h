/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelCipherContext.h"

@class OGCamelSession;

@interface OGCamelGpgContext : OGCamelCipherContext
{

}


/**
 * Constructors
 */
- (instancetype)init:(OGCamelSession*)session;

/**
 * Methods
 */

- (CamelGpgContext*)castedGObject;

/**
 *
 * @return
 */
- (bool)alwaysTrust;

/**
 * Returns, whether gpg can locate keys using Web Key Directory (WKD) lookup
 * when encrypting messages. The default is %TRUE.
 *
 * @return whether gpg can locate keys using Web Key Directory (WKD) lookup
 *    when encrypting messages.
 */
- (bool)locateKeys;

/**
 *
 * @return Whether prefer inline sign/encrypt (%TRUE), or as multiparts (%FALSE)
 */
- (bool)preferInline;

/**
 * Sets the @always_trust flag on the gpg context which is used for
 * encryption.
 *
 * @param alwaysTrust always trust flag
 */
- (void)setAlwaysTrust:(bool)alwaysTrust;

/**
 * Sets the @locate_keys on the gpg context which is used to instruct
 * gpg to locate keys using Web Key Directory (WKD) lookup when encrypting
 * messages.
 *
 * @param locateKeys value to set
 */
- (void)setLocateKeys:(bool)locateKeys;

/**
 * Sets the @prefer_inline flag on the gpg context.
 *
 * @param preferInline whether prefer inline sign/encrypt
 */
- (void)setPreferInline:(bool)preferInline;

@end