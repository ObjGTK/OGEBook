/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilter.h"

@interface OGCamelMimeFilterToHTML : OGCamelMimeFilter
{

}


/**
 * Constructors
 */
- (instancetype)initWithFlags:(CamelMimeFilterToHTMLFlags)flags color:(guint32)color;

/**
 * Methods
 */

- (CamelMimeFilterToHTML*)MIMEFILTERTOHTML;

@end