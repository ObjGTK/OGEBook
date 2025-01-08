/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceLocal.h"

@implementation OGESourceLocal

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_SOURCE_LOCAL;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (ESourceLocal*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceLocal, ESourceLocal);
}

- (GFile*)dupCustomFile
{
	GFile* returnValue = (GFile*)e_source_local_dup_custom_file([self castedGObject]);

	return returnValue;
}

- (OFString*)dupEmailAddress
{
	gchar* gobjectValue = e_source_local_dup_email_address([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (GFile*)customFile
{
	GFile* returnValue = (GFile*)e_source_local_get_custom_file([self castedGObject]);

	return returnValue;
}

- (OFString*)emailAddress
{
	const gchar* gobjectValue = e_source_local_get_email_address([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)writable
{
	bool returnValue = (bool)e_source_local_get_writable([self castedGObject]);

	return returnValue;
}

- (void)setCustomFile:(GFile*)customFile
{
	e_source_local_set_custom_file([self castedGObject], customFile);
}

- (void)setEmailAddress:(OFString*)emailAddress
{
	e_source_local_set_email_address([self castedGObject], [emailAddress UTF8String]);
}

- (void)setWritable:(bool)writable
{
	e_source_local_set_writable([self castedGObject], writable);
}


@end