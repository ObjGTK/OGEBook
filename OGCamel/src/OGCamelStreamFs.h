/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStream.h"

@interface OGCamelStreamFs : OGCamelStream
{

}


/**
 * Constructors
 */
+ (instancetype)streamFsWithFd:(gint)fd;
+ (instancetype)streamFsWithName:(OFString*)name flags:(gint)flags mode:(mode_t)mode;

/**
 * Methods
 */

- (CamelStreamFs*)castedGObject;

/**
 *
 * @return
 */
- (gint)fd;

@end