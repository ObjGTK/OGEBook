/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceExtension.h"

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGESourceRevisionGuards : OGESourceExtension
{

}


/**
 * Methods
 */

- (ESourceRevisionGuards*)castedGObject;

/**
 * Checks whether revision guards for the given #ESource are enabled.
 *
 * @return %TRUE if the revision guards are enabled.
 */
- (bool)enabled;

/**
 * Enables or disables the revision guards for a given #ESource.
 * 
 * Revision guards are disabled by default.
 *
 * @param enabled Whether to enable or disable the revision guards.
 */
- (void)setEnabled:(bool)enabled;

@end