/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceContacts.h"

@implementation OGESourceContacts

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_SOURCE_CONTACTS;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (ESourceContacts*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceContacts, ESourceContacts);
}

- (bool)includeMe
{
	bool returnValue = (bool)e_source_contacts_get_include_me([self castedGObject]);

	return returnValue;
}

- (void)setIncludeMe:(bool)includeMe
{
	e_source_contacts_set_include_me([self castedGObject], includeMe);
}


@end