/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceAddressBook.h"

@implementation OGESourceAddressBook

- (ESourceAddressBook*)castedGObject
{
	return E_SOURCE_ADDRESS_BOOK([self gObject]);
}

- (guint)order
{
	guint returnValue = e_source_address_book_get_order([self castedGObject]);

	return returnValue;
}

- (void)setOrder:(guint)order
{
	e_source_address_book_set_order([self castedGObject], order);
}


@end