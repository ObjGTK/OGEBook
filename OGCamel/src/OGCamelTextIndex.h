/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelIndex.h"

@interface OGCamelTextIndex : OGCamelIndex
{

}

/**
 * Functions
 */
+ (void)load;


/**
 *
 * @param path
 * @return
 */
+ (gint)check:(OFString*)path;

/**
 *
 * @param old
 * @return
 */
+ (gint)remove:(OFString*)old;

/**
 *
 * @param old
 * @param new
 * @return
 */
+ (gint)renameWithOld:(OFString*)old new:(OFString*)new;

/**
 * Constructors
 */
+ (instancetype)textIndexWithPath:(OFString*)path flags:(gint)flags;

/**
 * Methods
 */

- (CamelTextIndex*)castedGObject;

/**
 *
 */
- (void)dump;

/**
 *
 */
- (void)info;

/**
 *
 */
- (void)validate;

@end