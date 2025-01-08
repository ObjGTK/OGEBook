/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceAddressBook.h"

@implementation OGESourceAddressBook

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_SOURCE_ADDRESS_BOOK;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (ESourceAddressBook*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceAddressBook, ESourceAddressBook);
}

- (guint)order
{
	guint returnValue = (guint)e_source_address_book_get_order([self castedGObject]);

	return returnValue;
}

- (void)setOrder:(guint)order
{
	e_source_address_book_set_order([self castedGObject], order);
}


@end