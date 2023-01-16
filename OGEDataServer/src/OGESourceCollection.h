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
@interface OGESourceCollection : OGESourceBackend
{

}


/**
 * Methods
 */

- (ESourceCollection*)SOURCECOLLECTION;

/**
 * Thread-safe variation of e_source_collection_get_calendar_url().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceCollection:calendar-url
 */
- (OFString*)dupCalendarUrl;

/**
 * Thread-safe variation of e_source_collection_get_contacts_url().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceCollection:contacts-url
 */
- (OFString*)dupContactsUrl;

/**
 * Thread-safe variation of e_source_collection_get_identity().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceCollection:identity
 */
- (OFString*)dupIdentity;

/**
 * Returns whether the collection backend allows a user to rename child
 * sources. It is meant mainly for GUI. The default is %FALSE.
 *
 * @return whether the collection backend allows a user to rename child sources
 */
- (bool)allowSourcesRename;

/**
 * Returns whether calendar sources within the collection should be
 * enabled.
 * 
 * An #ECollectionBackend running within the registry D-Bus service will
 * automatically synchronize any calendar sources it maintains with the
 * #ESourceCollection:calendar-enabled property.
 *
 * @return whether calendar sources should be enabled
 */
- (bool)calendarEnabled;

/**
 * Returns the calendar top URL string, that is, where to search for calendar sources.
 *
 * @return the calendar top URL, or %NULL
 */
- (OFString*)calendarUrl;

/**
 * Returns whether address book sources within the collection should be
 * enabled.
 * 
 * An #ECollectionBackend running within the registry D-Bus service will
 * automatically synchronize any address book sources it maintains with
 * the #ESourceCollection:contacts-enabled property.
 *
 * @return whether address book sources should be enabled
 */
- (bool)contactsEnabled;

/**
 * Returns the contacts top URL string, that is, where to search for contact sources.
 *
 * @return the contacts top URL, or %NULL
 */
- (OFString*)contactsUrl;

/**
 * Returns the string used to uniquely identify the user account at
 * the service provider.  Often this is an email address or user name.
 *
 * @return the collection identity
 */
- (OFString*)identity;

/**
 * Returns whether mail sources within the collection should be enabled.
 * 
 * An #ECollectionBackend running within the registry D-Bus service will
 * automatically synchronize any mail sources it maintains with the
 * #ESourceCollection:mail-enabled property.
 *
 * @return whether mail sources should be enabled
 */
- (bool)mailEnabled;

/**
 * Sets whether the collection backend allows a user to rename child
 * sources. It is meant mainly for GUI. The default is %FALSE.
 *
 * @param allowSourcesRename whether mail sources should be enabled
 */
- (void)setAllowSourcesRename:(bool)allowSourcesRename;

/**
 * Sets whether calendar sources within the collection should be enabled.
 * 
 * An #ECollectionBackend running within the registry D-Bus service will
 * automatically synchronize any calendar sources it maintains with the
 * #ESourceCollection:calendar-enabled property.
 * 
 * Calling this function from a registry service client has no effect until
 * the change is submitted to the registry service through e_source_write(),
 * but there should rarely be any need for clients to call this.
 *
 * @param calendarEnabled whether calendar sources should be enabled
 */
- (void)setCalendarEnabled:(bool)calendarEnabled;

/**
 * Sets the calendar top URL, that is, where to search for calendar sources.
 * 
 * The internal copy of @calendar_url is automatically stripped of leading
 * and trailing whitespace. If the resulting string is empty, %NULL is set
 * instead.
 *
 * @param calendarUrl calendar top URL, or %NULL
 */
- (void)setCalendarUrl:(OFString*)calendarUrl;

/**
 * Sets whether address book sources within the collection should be enabled.
 * 
 * An #ECollectionBackend running within the registry D-Bus service will
 * automatically synchronize any address book sources it maintains with
 * the #ESourceCollection:contacts-enabled property.
 * 
 * Calling this function from a registry service client has no effect until
 * the change is submitted to the registry service through e_source_write(),
 * but there should rarely be any need for clients to call this.
 *
 * @param contactsEnabled whether address book sources should be enabled
 */
- (void)setContactsEnabled:(bool)contactsEnabled;

/**
 * Sets the contacts top URL, that is, where to search for contact sources.
 * 
 * The internal copy of @contacts_url is automatically stripped of leading
 * and trailing whitespace. If the resulting string is empty, %NULL is set
 * instead.
 *
 * @param contactsUrl contacts top URL, or %NULL
 */
- (void)setContactsUrl:(OFString*)contactsUrl;

/**
 * Sets the string used to uniquely identify the user account at the
 * service provider.  Often this is an email address or user name.
 * 
 * The internal copy of @identity is automatically stripped of leading
 * and trailing whitespace.  If the resulting string is empty, %NULL is
 * set instead.
 *
 * @param identity the collection identity, or %NULL
 */
- (void)setIdentity:(OFString*)identity;

/**
 * Sets whether mail sources within the collection should be enabled.
 * 
 * An #ECollectionBackend running within the registry D-Bus service will
 * automatically synchronize any mail sources it maintains with the
 * #ESourceCollection:mail-enabled property.
 * 
 * Calling this function from a registry service client has no effect until
 * the changes is submitted to the registry service through e_source_write(),
 * but there should rarely be any need for clients to call this.
 *
 * @param mailEnabled whether mail sources should be enabled
 */
- (void)setMailEnabled:(bool)mailEnabled;

@end