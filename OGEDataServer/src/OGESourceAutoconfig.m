/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceAutoconfig.h"

@implementation OGESourceAutoconfig

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_SOURCE_AUTOCONFIG;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (ESourceAutoconfig*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceAutoconfig, ESourceAutoconfig);
}

- (OFString*)dupRevision
{
	gchar* gobjectValue = e_source_autoconfig_dup_revision([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)revision
{
	const gchar* gobjectValue = e_source_autoconfig_get_revision([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setRevision:(OFString*)revision
{
	e_source_autoconfig_set_revision([self castedGObject], [revision UTF8String]);
}


@end