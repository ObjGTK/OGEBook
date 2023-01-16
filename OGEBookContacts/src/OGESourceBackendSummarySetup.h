/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <libebook-contacts/libebook-contacts.h>

#import <OGEDataServer/OGESourceExtension.h>

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGESourceBackendSummarySetup : OGESourceExtension
{

}


/**
 * Methods
 */

- (ESourceBackendSummarySetup*)SOURCEBACKENDSUMMARYSETUP;

/**
 * Fetches the #EContactFields configured to be indexed, with thier respective #EBookIndexTypes.
 *
 * @param types A return location for the set of #EBookIndexTypes corresponding
 *                                to each returned field,  should be freed with g_free() when no longer needed.
 * @param nfields The number of elements in the returned arrays.
 * @return The array of indexed #EContactFields.
 */
- (EContactField*)indexedFieldsWithTypes:(EBookIndexType**)types nfields:(gint*)nfields;

/**
 * Fetches the #EContactFields which are configured to be a part of the summary.
 * 
 * <note><para>If there are no configured summary fields, the default configuration is assumed</para></note>
 *
 * @param nfields A return location for the number of #EContactFields in the returned array.
 * @return An array of #EContactFields @n_fields long, should be freed with g_free() when done.
 */
- (EContactField*)summaryFields:(gint*)nfields;

/**
 * Defines indexes for quick reference for the given given #EContactFields in the addressbook.
 * 
 * The same #EContactField may be specified multiple times to create multiple indexes
 * with different characteristics. If an #E_BOOK_INDEX_PREFIX index is created it will
 * be used for #E_BOOK_QUERY_BEGINS_WITH queries. A #E_BOOK_INDEX_SUFFIX index
 * will be constructed efficiently for suffix matching and will be used for
 * #E_BOOK_QUERY_ENDS_WITH queries. Similar a #E_BOOK_INDEX_PHONE index will optimize
 * #E_BOOK_QUERY_EQUALS_PHONE_NUMBER searches.
 * 
 * <note><para>The specified indexed fields must also be a part of the summary, any indexed fields
 * specified that are not already a part of the summary will be ignored.</para></note>
 *
 * @param fields The array of #EContactFields to set indexes for
 * @param types The array of #EBookIndexTypes defining what types of indexes to create
 * @param nfields The number elements in the passed @fields, @rule_types and @rules arrays.
 */
- (void)setIndexedFieldsvWithFields:(EContactField*)fields types:(EBookIndexType*)types nfields:(gint)nfields;

/**
 * Sets the summary fields configured for the given addressbook.
 * 
 * The fields %E_CONTACT_UID and %E_CONTACT_REV are not optional,
 * they will be stored in the summary regardless of the configured summary.
 * 
 * An empty summary configuration is assumed to be the default summary
 * configuration.
 * 
 * <note><para>Only #EContactFields with the type #G_TYPE_STRING or #G_TYPE_BOOLEAN
 * are currently supported as summary fields.</para></note>
 *
 * @param fields The array of #EContactFields to set as summary fields
 * @param nfields The number of #EContactFields in @fields
 */
- (void)setSummaryFieldsvWithFields:(EContactField*)fields nfields:(gint)nfields;

@end