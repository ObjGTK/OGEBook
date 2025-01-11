/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceTaskList.h"

@implementation OGESourceTaskList

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_SOURCE_TASK_LIST;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (ESourceTaskList*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceTaskList, ESourceTaskList);
}


@end