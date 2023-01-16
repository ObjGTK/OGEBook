/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilter.h"

@interface OGCamelMimeFilterLinewrap : OGCamelMimeFilter
{

}


/**
 * Constructors
 */
- (instancetype)initWithPreferredLen:(guint)preferredLen maxLen:(guint)maxLen indentChar:(gchar)indentChar flags:(guint32)flags;

/**
 * Methods
 */

- (CamelMimeFilterLinewrap*)MIMEFILTERLINEWRAP;

@end