/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGENetworkMonitor.h"

@implementation OGENetworkMonitor

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_NETWORK_MONITOR;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GNetworkMonitor*)default
{
	GNetworkMonitor* returnValue = (GNetworkMonitor*)e_network_monitor_get_default();

	return returnValue;
}

- (ENetworkMonitor*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ENetworkMonitor, ENetworkMonitor);
}

- (OFString*)dupGioName
{
	gchar* gobjectValue = e_network_monitor_dup_gio_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (GSList*)listGioNames
{
	GSList* returnValue = (GSList*)e_network_monitor_list_gio_names([self castedGObject]);

	return returnValue;
}

- (void)setGioName:(OFString*)gioName
{
	e_network_monitor_set_gio_name([self castedGObject], [gioName UTF8String]);
}


@end