/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilter.h"

@interface OGCamelMimeFilterWindows : OGCamelMimeFilter
{

}


/**
 * Constructors
 */
- (instancetype)initWithClaimedCharset:(OFString*)claimedCharset;

/**
 * Methods
 */

- (CamelMimeFilterWindows*)castedGObject;

/**
 * Get whether or not the textual content filtered by @filter is
 * really in a Microsoft Windows charset rather than the claimed ISO
 * charset.
 *
 * @return %TRUE if the text was found to be in a Microsoft Windows
 * CP125x charset or %FALSE otherwise.
 */
- (bool)isWindowsCharset;

/**
 * Get the name of the actual charset used to encode the textual
 * content filtered by @filter (it will either be the original
 * claimed_charset passed in at creation time or the Windows-CP125x
 * equivalent).
 *
 * @return the name of the actual charset
 */
- (OFString*)realCharset;

@end