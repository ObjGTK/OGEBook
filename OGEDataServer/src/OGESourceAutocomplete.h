/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceExtension.h"

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGESourceAutocomplete : OGESourceExtension
{

}


/**
 * Methods
 */

- (ESourceAutocomplete*)SOURCEAUTOCOMPLETE;

/**
 * Returns whether the address book described by the #ESource to which
 * @extension belongs should be queried when the user inputs a partial
 * contact name or email address.
 *
 * @return whether to use the autocomplete feature
 */
- (bool)includeMe;

/**
 * Sets whether the address book described by the #ESource to which
 * @extension belongs should be queried when the user inputs a partial
 * contact name or email address.
 *
 * @param includeMe whether to use the autocomplete feature
 */
- (void)setIncludeMe:(bool)includeMe;

@end