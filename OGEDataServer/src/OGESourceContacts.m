/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceContacts.h"

@implementation OGESourceContacts

- (ESourceContacts*)SOURCECONTACTS
{
	return E_SOURCE_CONTACTS([self GOBJECT]);
}

- (bool)includeMe
{
	return e_source_contacts_get_include_me([self SOURCECONTACTS]);
}

- (void)setIncludeMe:(bool)includeMe
{
	e_source_contacts_set_include_me([self SOURCECONTACTS], includeMe);
}


@end