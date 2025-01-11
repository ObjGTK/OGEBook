/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@interface OGCamelKeyFile : OGObject
{

}


/**
 * Constructors
 */
+ (instancetype)keyFileWithPath:(OFString*)path flags:(gint)flags version:(OFString*)version;

/**
 * Methods
 */

- (CamelKeyFile*)castedGObject;

/**
 *
 * @return
 */
- (gint)delete;

/**
 * Read the next block of data from the key file.  Returns the number of
 * records.
 *
 * @param start The record pointer.  This will be set to the next record pointer on success.
 * @param len Number of records read, if != NULL.
 * @param records Records, allocated, must be freed with g_free, if != NULL.
 * @return -1 on io error.
 */
- (gint)readWithStart:(camel_block_t*)start len:(gsize*)len records:(camel_key_t**)records;

/**
 *
 * @param path
 * @return
 */
- (gint)rename:(OFString*)path;

/**
 * Write a new list of records to the key file.
 *
 * @param parent a #camel_block_t
 * @param len how many @records to write
 * @param records an array of #camel_key_t to write
 * @return -1 on io error.  The key file will remain unchanged.
 */
- (gint)writeWithParent:(camel_block_t*)parent len:(gsize)len records:(camel_key_t*)records;

@end