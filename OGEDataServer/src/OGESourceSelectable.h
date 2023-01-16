/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceBackend.h"

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGESourceSelectable : OGESourceBackend
{

}


/**
 * Methods
 */

- (ESourceSelectable*)SOURCESELECTABLE;

/**
 * Thread-safe variation of e_source_selectable_get_color().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceSelectable:color,
 *    or %NULL, when none is set
 */
- (OFString*)dupColor;

/**
 * Returns the color specification for the #ESource to which @extension
 * belongs.  A colored block is often displayed next to the data source's
 * display name in user interfaces.
 *
 * @return the color specification for the #ESource,
 *    or %NULL, when none is set
 */
- (OFString*)color;

/**
 * Returns the selected state of the #ESource to which @extension belongs.
 * The selected state is often represented as a checkbox next to the data
 * source's display name in user interfaces.
 *
 * @return the selected state for the #ESource
 */
- (bool)selected;

/**
 * Sets the color specification for the #ESource to which @extension
 * belongs.  A colored block is often displayed next to the data source's
 * display name in user interfaces.
 * 
 * The internal copy of @color is automatically stripped of leading and
 * trailing whitespace.  If the resulting string is empty, %NULL is set
 * instead.
 *
 * @param color a color specification, or %NULL
 */
- (void)setColor:(OFString*)color;

/**
 * Sets the selected state for the #ESource to which @extension belongs.
 * The selected state is often represented as a checkbox next to the data
 * source's display name in user interfaces.
 *
 * @param selected selected state
 */
- (void)setSelected:(bool)selected;

@end