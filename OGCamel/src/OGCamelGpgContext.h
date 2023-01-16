/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
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

- (CamelGpgContext*)GPGCONTEXT;

/**
 *
 * @return
 */
- (bool)alwaysTrust;

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
 * Sets the @prefer_inline flag on the gpg context.
 *
 * @param preferInline whether prefer inline sign/encrypt
 */
- (void)setPreferInline:(bool)preferInline;

@end