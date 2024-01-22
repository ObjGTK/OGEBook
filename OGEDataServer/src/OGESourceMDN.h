/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceExtension.h"

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGESourceMDN : OGESourceExtension
{

}


/**
 * Methods
 */

- (ESourceMDN*)castedGObject;

/**
 * Returns the policy for this mail account on responding to Message
 * Disposition Notification requests when receiving mail messages.
 *
 * @return the #EMdnResponsePolicy for this account
 */
- (EMdnResponsePolicy)responsePolicy;

/**
 * Sets the policy for this mail account on responding to Message
 * Disposition Notification requests when receiving mail messages.
 *
 * @param responsePolicy the #EMdnResponsePolicy
 */
- (void)setResponsePolicy:(EMdnResponsePolicy)responsePolicy;

@end