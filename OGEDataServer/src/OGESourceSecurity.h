/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceExtension.h"

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGESourceSecurity : OGESourceExtension
{

}


/**
 * Methods
 */

- (ESourceSecurity*)castedGObject;

/**
 * Thread-safe variation of e_source_security_get_method().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceSecurity:method
 */
- (OFString*)dupMethod;

/**
 * Returns the method used to establish a secure network connection to a
 * remote account.  There are no pre-defined method names; backends are
 * free to set this however they wish.  If a secure connection is not
 * desired, the convention is to set #ESourceSecurity:method to "none".
 *
 * @return the method used to establish a secure network connection
 */
- (OFString*)method;

/**
 * This is a convenience function which returns whether a secure network
 * connection is desired, regardless of the method used.  This relies on
 * the convention of setting #ESourceSecurity:method to "none" when a
 * secure network connection is <emphasis>not</emphasis> desired.
 *
 * @return whether a secure network connection is desired
 */
- (bool)secure;

/**
 * Sets the method used to establish a secure network connection to a
 * remote account.  There are no pre-defined method names; backends are
 * free to set this however they wish.  If a secure connection is not
 * desired, the convention is to set #ESourceSecurity:method to "none".
 * In keeping with that convention, #ESourceSecurity:method will be set
 * to "none" if @method is %NULL or an empty string.
 *
 * @param method security method, or %NULL
 */
- (void)setMethod:(OFString*)method;

/**
 * This function provides a simpler way to set #ESourceSecurity:method
 * when using a secure network connection is a yes or no option and the
 * exact method name is unimportant.  If @secure is %FALSE, the
 * #ESourceSecurity:method property is set to "none".  If @secure is
 * %TRUE, the function assumes the backend will use Transport Layer
 * Security and sets the #ESourceSecurity:method property to "tls".
 *
 * @param secure whether a secure network connection is desired
 */
- (void)setSecure:(bool)secure;

@end