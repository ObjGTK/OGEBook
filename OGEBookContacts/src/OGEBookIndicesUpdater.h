/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <libebook-contacts/libebook-contacts.h>

#import <OGObject/OGObject.h>

/**
 * An abstract object to handle EBookIndices changes.
 *
 */
@interface OGEBookIndicesUpdater : OGObject
{

}


/**
 * Methods
 */

- (EBookIndicesUpdater*)castedGObject;

/**
 * Notifies the @self that a new contact with UID @uid had been added
 * to the set and it occupies the @indices_index index in the indices.
 * In case the @uid had been added previously its index is modified
 * instead.
 * 
 * This function can be used only after initial call to e_book_indices_updater_take_indices().
 *
 * @param uid a UID of a contact
 * @param indicesIndex index to the indices array the contact belongs to
 * @return whether the indices changed
 */
- (bool)addWithUid:(OFString*)uid indicesIndex:(guint)indicesIndex;

/**
 * Sets the initial indices to be updated by the @self. If %NULL,
 * then unsets them.
 *
 * @return current indices, or %NULL, when none had been set yet
 */
- (const EBookIndices*)indices;

/**
 * Notifies the @self that an existing contact with UID @uid had been removed
 * from the set. Calling the function with @uid unknown to the @self does nothing
 * and returns %FALSE.
 * 
 * This function can be used only after initial call to e_book_indices_updater_take_indices().
 *
 * @param uid a UID of a removed contact
 * @return whether the indices changed
 */
- (bool)remove:(OFString*)uid;

/**
 * Sets the initial indices to be updated by the @self. If %NULL,
 * then unsets them. The function always discards data previously
 * gathered about the involved contacts, regardless whether
 * the indices changed or not.
 * 
 * The function assumes ownership of the @indices.
 *
 * @param indices an #EBookIndices, or %NULL
 * @return whether the indices changed
 */
- (bool)takeIndices:(EBookIndices*)indices;

@end