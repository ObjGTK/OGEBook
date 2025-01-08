/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceSecurity.h"

@implementation OGESourceSecurity

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_SOURCE_SECURITY;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (ESourceSecurity*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceSecurity, ESourceSecurity);
}

- (OFString*)dupMethod
{
	gchar* gobjectValue = e_source_security_dup_method([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)method
{
	const gchar* gobjectValue = e_source_security_get_method([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)secure
{
	bool returnValue = (bool)e_source_security_get_secure([self castedGObject]);

	return returnValue;
}

- (void)setMethod:(OFString*)method
{
	e_source_security_set_method([self castedGObject], [method UTF8String]);
}

- (void)setSecure:(bool)secure
{
	e_source_security_set_secure([self castedGObject], secure);
}


@end