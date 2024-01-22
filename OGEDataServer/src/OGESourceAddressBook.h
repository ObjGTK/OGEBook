/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceBackend.h"

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGESourceAddressBook : OGESourceBackend
{

}


/**
 * Methods
 */

- (ESourceAddressBook*)castedGObject;

/**
 *
 * @return the sorting order of the source, if known. Zero is the default.
 */
- (guint)order;

/**
 * Set the sorting order of the source.
 *
 * @param order a sorting order
 */
- (void)setOrder:(guint)order;

@end