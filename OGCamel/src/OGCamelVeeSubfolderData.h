/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@class OGCamelFolder;

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGCamelVeeSubfolderData : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init:(OGCamelFolder*)folder;

/**
 * Methods
 */

- (CamelVeeSubfolderData*)VEESUBFOLDERDATA;

/**
 *
 * @return a #CamelFolder to which this @data was created
 */
- (OGCamelFolder*)folder;

/**
 *
 * @return a folder ID for this subfolder @data
 */
- (OFString*)folderId;

@end