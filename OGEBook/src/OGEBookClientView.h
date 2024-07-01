/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <libebook/libebook.h>

#import <OGObject/OGObject.h>

@class OGDBusConnection;
@class OGEBookClient;

/**
 * Contains only private data the should be read and manipulated using the
 * functions below.
 *
 */
@interface OGEBookClientView : OGObject
{

}


/**
 * Methods
 */

- (EBookClientView*)castedGObject;

/**
 * Returns the #EBookClientView:client associated with @client_view.
 *
 * @return an #EBookClient
 */
- (OGEBookClient*)client;

/**
 * Returns the #GDBusConnection used to create the D-Bus proxy.
 *
 * @return the #GDBusConnection
 */
- (OGDBusConnection*)connection;

/**
 * Returns the object path used to create the D-Bus proxy.
 *
 * @return the object path
 */
- (OFString*)objectPath;

/**
 *
 * @return
 */
- (bool)isRunning;

/**
 * Returns the #EBookClientView:client associated with @client_view.
 * 
 * The returned #EBookClient is referenced for thread-safety.  Unreference
 * the #EBookClient with g_object_unref() when finished with it.
 *
 * @return an #EBookClient
 */
- (OGEBookClient*)refClient;

/**
 * Client can instruct server to which fields it is interested in only, thus
 * the server can return less data over the wire. The server can still return
 * complete objects, this is just a hint to it that the listed fields will
 * be used only. The UID field is returned always. Initial views has no fields
 * of interest and using %NULL for @fields_of_interest will unset any previous
 * changes.
 * 
 * Some backends can use summary information of its cache to create artifical
 * objects, which will omit stored object parsing. If this cannot be done then
 * it will simply return object as is stored in the cache.
 *
 * @param fieldsOfInterest List of field names in which
 *                      the client is interested
 */
- (void)setFieldsOfInterest:(const GSList*)fieldsOfInterest;

/**
 * Sets the @flags which control the behaviour of @client_view.
 *
 * @param flags the #EBookClientViewFlags for @client_view
 */
- (void)setFlags:(EBookClientViewFlags)flags;

/**
 * Tells @client_view to start processing events.
 *
 */
- (void)start;

/**
 * Tells @client_view to stop processing events.
 *
 */
- (void)stop;

@end