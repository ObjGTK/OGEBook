/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
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

- (CamelLocalSettings*)castedGObject;

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
 * Returns, whether the Maildir provider should use alternative
 * flag separator in the file name. When %TRUE, uses an exclamation
 * mark (!), when %FALSE, uses the colon (:). The default
 * is %FALSE, to be consistent with the Maildir specification.
 * The flag separator is flipped on the Windows build.
 *
 * @return whether the Maildir provider should use an alternative flag separator
 */
- (bool)maildirAltFlagSep;

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
 * Sets whether Maildir should use alternative flag separator.
 * See camel_local_settings_get_maildir_alt_flag_sep() for more
 * information on what it means.
 * 
 * Note: Change to this setting takes effect only for newly created
 *     Maildir stores.
 *
 * @param maildirAltFlagSep value to set
 */
- (void)setMaildirAltFlagSep:(bool)maildirAltFlagSep;

/**
 * Sets the file path to the root of the local mail store.  Any
 * trailing directory separator characters will be stripped off
 * of the #CamelLocalSettings:path property.
 *
 * @param path the file path to the local store
 */
- (void)setPath:(OFString*)path;

@end