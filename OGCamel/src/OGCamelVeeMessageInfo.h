/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMessageInfo.h"

@class OGCamelFolder;
@class OGCamelFolderSummary;

@interface OGCamelVeeMessageInfo : OGCamelMessageInfo
{

}


/**
 * Constructors
 */
- (instancetype)initWithSummary:(OGCamelFolderSummary*)summary originalSummary:(OGCamelFolderSummary*)originalSummary vuid:(OFString*)vuid;

/**
 * Methods
 */

- (CamelVeeMessageInfo*)castedGObject;

/**
 *
 * @return A #CamelFolder of the original
 *   message info, which this @vmi is proxying.
 */
- (OGCamelFolder*)originalFolder;

/**
 *
 * @return A #CamelFolderSummary of the original
 *   message info, which this @vmi is proxying.
 */
- (OGCamelFolderSummary*)originalSummary;

@end