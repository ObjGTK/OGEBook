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
@interface OGESourceUoa : OGESourceExtension
{

}


/**
 * Methods
 */

- (ESourceUoa*)SOURCEUOA;

/**
 * Returns the numeric identifier of the Ubuntu Online Account associated
 * with the #ESource to which @extension belongs.
 *
 * @return the associated Ubuntu Online Account ID
 */
- (guint)accountId;

/**
 * Sets the numeric identifier of the Ubuntu Online Account associated
 * with the #ESource to which @extension belongs.
 *
 * @param accountId the associated Ubuntu Online Account ID
 */
- (void)setAccountId:(guint)accountId;

@end