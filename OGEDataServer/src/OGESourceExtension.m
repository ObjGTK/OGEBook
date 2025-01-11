/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceExtension.h"

#import "OGESource.h"

@implementation OGESourceExtension

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_SOURCE_EXTENSION;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (ESourceExtension*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceExtension, ESourceExtension);
}

- (OGESource*)source
{
	ESource* gobjectValue = e_source_extension_get_source([self castedGObject]);

	OGESource* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)propertyLock
{
	e_source_extension_property_lock([self castedGObject]);
}

- (void)propertyUnlock
{
	e_source_extension_property_unlock([self castedGObject]);
}

- (OGESource*)refSource
{
	ESource* gobjectValue = e_source_extension_ref_source([self castedGObject]);

	OGESource* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}


@end