/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceMailIdentity.h"

@implementation OGESourceMailIdentity

- (ESourceMailIdentity*)SOURCEMAILIDENTITY
{
	return E_SOURCE_MAIL_IDENTITY([self GOBJECT]);
}

- (OFString*)dupAddress
{
	return [OFString stringWithUTF8String:e_source_mail_identity_dup_address([self SOURCEMAILIDENTITY])];
}

- (OFString*)dupAliases
{
	return [OFString stringWithUTF8String:e_source_mail_identity_dup_aliases([self SOURCEMAILIDENTITY])];
}

- (OFString*)dupName
{
	return [OFString stringWithUTF8String:e_source_mail_identity_dup_name([self SOURCEMAILIDENTITY])];
}

- (OFString*)dupOrganization
{
	return [OFString stringWithUTF8String:e_source_mail_identity_dup_organization([self SOURCEMAILIDENTITY])];
}

- (OFString*)dupReplyTo
{
	return [OFString stringWithUTF8String:e_source_mail_identity_dup_reply_to([self SOURCEMAILIDENTITY])];
}

- (OFString*)dupSignatureUid
{
	return [OFString stringWithUTF8String:e_source_mail_identity_dup_signature_uid([self SOURCEMAILIDENTITY])];
}

- (OFString*)address
{
	return [OFString stringWithUTF8String:e_source_mail_identity_get_address([self SOURCEMAILIDENTITY])];
}

- (OFString*)aliases
{
	return [OFString stringWithUTF8String:e_source_mail_identity_get_aliases([self SOURCEMAILIDENTITY])];
}

- (GHashTable*)aliasesAsHashTable
{
	return e_source_mail_identity_get_aliases_as_hash_table([self SOURCEMAILIDENTITY]);
}

- (OFString*)name
{
	return [OFString stringWithUTF8String:e_source_mail_identity_get_name([self SOURCEMAILIDENTITY])];
}

- (OFString*)organization
{
	return [OFString stringWithUTF8String:e_source_mail_identity_get_organization([self SOURCEMAILIDENTITY])];
}

- (OFString*)replyTo
{
	return [OFString stringWithUTF8String:e_source_mail_identity_get_reply_to([self SOURCEMAILIDENTITY])];
}

- (OFString*)signatureUid
{
	return [OFString stringWithUTF8String:e_source_mail_identity_get_signature_uid([self SOURCEMAILIDENTITY])];
}

- (void)setAddress:(OFString*)address
{
	e_source_mail_identity_set_address([self SOURCEMAILIDENTITY], [address UTF8String]);
}

- (void)setAliases:(OFString*)aliases
{
	e_source_mail_identity_set_aliases([self SOURCEMAILIDENTITY], [aliases UTF8String]);
}

- (void)setName:(OFString*)name
{
	e_source_mail_identity_set_name([self SOURCEMAILIDENTITY], [name UTF8String]);
}

- (void)setOrganization:(OFString*)organization
{
	e_source_mail_identity_set_organization([self SOURCEMAILIDENTITY], [organization UTF8String]);
}

- (void)setReplyTo:(OFString*)replyTo
{
	e_source_mail_identity_set_reply_to([self SOURCEMAILIDENTITY], [replyTo UTF8String]);
}

- (void)setSignatureUid:(OFString*)signatureUid
{
	e_source_mail_identity_set_signature_uid([self SOURCEMAILIDENTITY], [signatureUid UTF8String]);
}


@end