/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStoreSettings.h"

@implementation OGCamelStoreSettings

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_STORE_SETTINGS;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (CamelStoreSettings*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelStoreSettings, CamelStoreSettings);
}

- (bool)filterInbox
{
	bool returnValue = (bool)camel_store_settings_get_filter_inbox([self castedGObject]);

	return returnValue;
}

- (gint)storeChangesInterval
{
	gint returnValue = (gint)camel_store_settings_get_store_changes_interval([self castedGObject]);

	return returnValue;
}

- (void)setFilterInbox:(bool)filterInbox
{
	camel_store_settings_set_filter_inbox([self castedGObject], filterInbox);
}

- (void)setStoreChangesInterval:(gint)interval
{
	camel_store_settings_set_store_changes_interval([self castedGObject], interval);
}


@end