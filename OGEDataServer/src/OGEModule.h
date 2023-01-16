/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <libedataserver/libedataserver.h>

#import <OGObject/OGObject.h>

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGEModule : OGObject
{

}

/**
 * Functions
 */

/**
 * Loads all the modules in the specified directory into memory.  If
 * you want to unload them (enabling on-demand loading) you must call
 * g_type_module_unuse() on all the modules.  Free the returned list
 * with g_list_free().
 *
 * @param dirname pathname for a directory containing modules to load
 * @return a list of #EModules loaded from @dirname
 */
+ (GList*)loadAllInDirectory:(OFString*)dirname;

/**
 * Load the module from the specified filename into memory. If
 * you want to unload it (enabling on-demand loading) you must call
 * g_type_module_unuse() on the module.
 *
 * @param filename filename of the module to load
 * @return an #EModule loaded from @filename
 */
+ (OGEModule*)loadFile:(OFString*)filename;

/**
 * Constructors
 */
- (instancetype)init:(OFString*)filename;

/**
 * Methods
 */

- (EModule*)MODULE;

/**
 * Returns the filename of the shared library for @module.  The
 * string is owned by @module and should not be modified or freed.
 *
 * @return the filename for @module
 */
- (OFString*)filename;

@end