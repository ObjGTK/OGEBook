/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@class OGCamelVeeSubfolderData;

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGCamelVeeMessageInfoData : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initWithSubfolderData:(OGCamelVeeSubfolderData*)subfolderData origMessageUid:(OFString*)origMessageUid;

/**
 * Methods
 */

- (CamelVeeMessageInfoData*)castedGObject;

/**
 *
 * @return The original message info's UID, for which
 *    the @data had been created.
 */
- (OFString*)origMessageUid;

/**
 *
 * @return A #CamelVeeSubfolderData for which
 *    the @data had been created.
 */
- (OGCamelVeeSubfolderData*)subfolderData;

/**
 *
 * @return Message UID corresponding to this virtual
 *    message info @data.
 */
- (OFString*)veeMessageUid;

@end