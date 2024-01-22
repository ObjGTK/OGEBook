/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceExtension.h"

@interface OGESourceLocal : OGESourceExtension
{

}


/**
 * Methods
 */

- (ESourceLocal*)castedGObject;

/**
 * A thread safe variant to get a custom file being set on the @extension.
 * Free the returned #GFile, if not %NULL, with g_object_unref(),
 * when no longer needed.
 *
 * @return the #GFile instance, or %NULL
 */
- (GFile*)dupCustomFile;

/**
 * Thread-safe variation of e_source_lcoal_get_email_address().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceLocal:email-address
 */
- (OFString*)dupEmailAddress;

/**
 * Get the custom file being set on the @extension.
 * The returned #GFile is owned by the @extension.
 * 
 * For thread safety use e_source_local_dup_custom_file().
 *
 * @return the #GFile instance, or %NULL
 */
- (GFile*)customFile;

/**
 *
 * @return the email address for @extension
 */
- (OFString*)emailAddress;

/**
 * Returns whether the backend should prefer to open the file
 * in writable mode. The default is %TRUE. The file can be still
 * opened for read-only, for example when the access to the file
 * is read-only.
 *
 * @return whether prefer to pen the file in writable mode
 */
- (bool)writable;

/**
 * Set, or unset, when using %NULL, the custom file for the @extension.
 *
 * @param customFile a #GFile, or %NULL
 */
- (void)setCustomFile:(GFile*)customFile;

/**
 * Sets the email address for @extension.
 * 
 * The internal copy of @email_address is automatically stripped of leading
 * and trailing whitespace. If the resulting string is empty, %NULL is set
 * instead.
 *
 * @param emailAddress an email address, or %NULL
 */
- (void)setEmailAddress:(OFString*)emailAddress;

/**
 * Set whether the custom file should be opened in writable mode.
 * The default is %TRUE. The file can be still opened for read-only,
 * for example when the access to the file is read-only.
 *
 * @param writable value to set
 */
- (void)setWritable:(bool)writable;

@end