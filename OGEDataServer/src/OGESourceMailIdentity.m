/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceMailIdentity.h"

@implementation OGESourceMailIdentity

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_SOURCE_MAIL_IDENTITY;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (ESourceMailIdentity*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceMailIdentity, ESourceMailIdentity);
}

- (OFString*)dupAddress
{
	gchar* gobjectValue = e_source_mail_identity_dup_address([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupAliases
{
	gchar* gobjectValue = e_source_mail_identity_dup_aliases([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupName
{
	gchar* gobjectValue = e_source_mail_identity_dup_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupOrganization
{
	gchar* gobjectValue = e_source_mail_identity_dup_organization([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupReplyTo
{
	gchar* gobjectValue = e_source_mail_identity_dup_reply_to([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupSignatureUid
{
	gchar* gobjectValue = e_source_mail_identity_dup_signature_uid([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)address
{
	const gchar* gobjectValue = e_source_mail_identity_get_address([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)aliases
{
	const gchar* gobjectValue = e_source_mail_identity_get_aliases([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GHashTable*)aliasesAsHashTable
{
	GHashTable* returnValue = (GHashTable*)e_source_mail_identity_get_aliases_as_hash_table([self castedGObject]);

	return returnValue;
}

- (OFString*)name
{
	const gchar* gobjectValue = e_source_mail_identity_get_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)organization
{
	const gchar* gobjectValue = e_source_mail_identity_get_organization([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)replyTo
{
	const gchar* gobjectValue = e_source_mail_identity_get_reply_to([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)signatureUid
{
	const gchar* gobjectValue = e_source_mail_identity_get_signature_uid([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setAddress:(OFString*)address
{
	e_source_mail_identity_set_address([self castedGObject], [address UTF8String]);
}

- (void)setAliases:(OFString*)aliases
{
	e_source_mail_identity_set_aliases([self castedGObject], [aliases UTF8String]);
}

- (void)setName:(OFString*)name
{
	e_source_mail_identity_set_name([self castedGObject], [name UTF8String]);
}

- (void)setOrganization:(OFString*)organization
{
	e_source_mail_identity_set_organization([self castedGObject], [organization UTF8String]);
}

- (void)setReplyTo:(OFString*)replyTo
{
	e_source_mail_identity_set_reply_to([self castedGObject], [replyTo UTF8String]);
}

- (void)setSignatureUid:(OFString*)signatureUid
{
	e_source_mail_identity_set_signature_uid([self castedGObject], [signatureUid UTF8String]);
}


@end