/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStoreSettings.h"

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGCamelLocalSettings : OGCamelStoreSettings
{

}


/**
 * Methods
 */

- (CamelLocalSettings*)LOCALSETTINGS;

/**
 * Thread-safe variation of camel_local_settings_get_path().
 * Use this function when accessing @settings from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #CamelLocalSettings:path
 */
- (OFString*)dupPath;

/**
 * Returns whether apply filters in all folders.
 *
 * @return whether to apply filters in all folders
 */
- (bool)filterAll;

/**
 * Returns whether to check new messages for junk.
 *
 * @return whether to check new messages for junk
 */
- (bool)filterJunk;

/**
 * Returns the file path to the root of the local mail store.
 *
 * @return the file path to the local store
 */
- (OFString*)path;

/**
 * Sets whether to apply filters in all folders.
 *
 * @param filterAll whether to apply filters in all folders
 */
- (void)setFilterAll:(bool)filterAll;

/**
 * Sets whether to check new messages for junk.
 *
 * @param filterJunk whether to check new messages for junk
 */
- (void)setFilterJunk:(bool)filterJunk;

/**
 * Sets the file path to the root of the local mail store.  Any
 * trailing directory separator characters will be stripped off
 * of the #CamelLocalSettings:path property.
 *
 * @param path the file path to the local store
 */
- (void)setPath:(OFString*)path;

@end