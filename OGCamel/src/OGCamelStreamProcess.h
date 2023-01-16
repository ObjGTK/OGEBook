/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStream.h"

@interface OGCamelStreamProcess : OGCamelStream
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (CamelStreamProcess*)STREAMPROCESS;

/**
 *
 * @param command
 * @param env
 * @param err
 * @return
 */
- (gint)connectWithCommand:(OFString*)command env:(const gchar**)env err:(GError**)err;

@end