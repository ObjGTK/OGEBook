/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceExtension.h"

@interface OGESourceContacts : OGESourceExtension
{

}


/**
 * Methods
 */

- (ESourceContacts*)castedGObject;

/**
 *
 * @return
 */
- (bool)includeMe;

/**
 *
 * @param includeMe
 */
- (void)setIncludeMe:(bool)includeMe;

@end