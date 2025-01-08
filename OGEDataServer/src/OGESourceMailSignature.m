/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceMailSignature.h"

@implementation OGESourceMailSignature

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_SOURCE_MAIL_SIGNATURE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (ESourceMailSignature*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceMailSignature, ESourceMailSignature);
}

- (OFString*)dupMimeType
{
	gchar* gobjectValue = e_source_mail_signature_dup_mime_type([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (GFile*)file
{
	GFile* returnValue = (GFile*)e_source_mail_signature_get_file([self castedGObject]);

	return returnValue;
}

- (OFString*)mimeType
{
	const gchar* gobjectValue = e_source_mail_signature_get_mime_type([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setMimeType:(OFString*)mimeType
{
	e_source_mail_signature_set_mime_type([self castedGObject], [mimeType UTF8String]);
}


@end