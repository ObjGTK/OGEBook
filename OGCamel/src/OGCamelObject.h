/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@interface OGCamelObject : OGObject
{

}


/**
 * Methods
 */

- (CamelObject*)castedGObject;

/**
 * Returns the name of the file in which persistent property values for
 * @object are stored.  The file is used by camel_object_state_write()
 * and camel_object_state_read() to save and restore object state.
 *
 * @return the name of the persistent property file
 */
- (OFString*)stateFilename;

/**
 * Sets the name of the file in which persistent property values for
 * @object are stored.  The file is used by camel_object_state_write()
 * and camel_object_state_read() to save and restore object state.
 *
 * @param stateFilename path to a local file
 */
- (void)setStateFilename:(OFString*)stateFilename;

/**
 * Read persistent object state from #CamelObject:state-filename.
 *
 * @return -1 on error.
 */
- (gint)stateRead;

/**
 * Write persistent object state #CamelObject:state-filename.
 *
 * @return -1 on error.
 */
- (gint)stateWrite;

@end