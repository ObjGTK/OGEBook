/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStoreSettings.h"

@implementation OGCamelStoreSettings

- (CamelStoreSettings*)STORESETTINGS
{
	return CAMEL_STORE_SETTINGS([self GOBJECT]);
}

- (bool)filterInbox
{
	return camel_store_settings_get_filter_inbox([self STORESETTINGS]);
}

- (gint)storeChangesInterval
{
	return camel_store_settings_get_store_changes_interval([self STORESETTINGS]);
}

- (void)setFilterInbox:(bool)filterInbox
{
	camel_store_settings_set_filter_inbox([self STORESETTINGS], filterInbox);
}

- (void)setStoreChangesInterval:(gint)interval
{
	camel_store_settings_set_store_changes_interval([self STORESETTINGS], interval);
}


@end