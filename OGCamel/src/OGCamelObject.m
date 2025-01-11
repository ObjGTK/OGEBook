/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelObject.h"

@implementation OGCamelObject

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_OBJECT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (CamelObject*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelObject, CamelObject);
}

- (OFString*)stateFilename
{
	const gchar* gobjectValue = camel_object_get_state_filename([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setStateFilename:(OFString*)stateFilename
{
	camel_object_set_state_filename([self castedGObject], [stateFilename UTF8String]);
}

- (gint)stateRead
{
	gint returnValue = (gint)camel_object_state_read([self castedGObject]);

	return returnValue;
}

- (gint)stateWrite
{
	gint returnValue = (gint)camel_object_state_write([self castedGObject]);

	return returnValue;
}


@end