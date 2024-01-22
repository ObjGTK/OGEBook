/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <libedataserver/libedataserver.h>

#import <OGObject/OGObject.h>

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGEExtension : OGObject
{

}


/**
 * Methods
 */

- (EExtension*)castedGObject;

/**
 * Returns the object that @extension extends.
 *
 * @return the object being extended
 */
- (EExtensible*)extensible;

@end