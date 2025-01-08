/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
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

- (CamelStreamProcess*)castedGObject;

/**
 *
 * @param command
 * @param env
 * @return
 */
- (gint)connectWithCommand:(OFString*)command env:(const gchar**)env;

@end