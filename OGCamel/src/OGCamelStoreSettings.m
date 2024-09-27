/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStoreSettings.h"

@implementation OGCamelStoreSettings

- (CamelStoreSettings*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelStoreSettings, CamelStoreSettings);
}

- (bool)filterInbox
{
	bool returnValue = camel_store_settings_get_filter_inbox([self castedGObject]);

	return returnValue;
}

- (gint)storeChangesInterval
{
	gint returnValue = camel_store_settings_get_store_changes_interval([self castedGObject]);

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