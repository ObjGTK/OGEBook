/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceSMIME.h"

@implementation OGESourceSMIME

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_SOURCE_SMIME;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (ESourceSMIME*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceSMIME, ESourceSMIME);
}

- (OFString*)dupEncryptionCertificate
{
	gchar* gobjectValue = e_source_smime_dup_encryption_certificate([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupSigningAlgorithm
{
	gchar* gobjectValue = e_source_smime_dup_signing_algorithm([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupSigningCertificate
{
	gchar* gobjectValue = e_source_smime_dup_signing_certificate([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (bool)encryptByDefault
{
	bool returnValue = (bool)e_source_smime_get_encrypt_by_default([self castedGObject]);

	return returnValue;
}

- (bool)encryptToSelf
{
	bool returnValue = (bool)e_source_smime_get_encrypt_to_self([self castedGObject]);

	return returnValue;
}

- (OFString*)encryptionCertificate
{
	const gchar* gobjectValue = e_source_smime_get_encryption_certificate([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)signByDefault
{
	bool returnValue = (bool)e_source_smime_get_sign_by_default([self castedGObject]);

	return returnValue;
}

- (OFString*)signingAlgorithm
{
	const gchar* gobjectValue = e_source_smime_get_signing_algorithm([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)signingCertificate
{
	const gchar* gobjectValue = e_source_smime_get_signing_certificate([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setEncryptByDefault:(bool)encryptByDefault
{
	e_source_smime_set_encrypt_by_default([self castedGObject], encryptByDefault);
}

- (void)setEncryptToSelf:(bool)encryptToSelf
{
	e_source_smime_set_encrypt_to_self([self castedGObject], encryptToSelf);
}

- (void)setEncryptionCertificate:(OFString*)encryptionCertificate
{
	e_source_smime_set_encryption_certificate([self castedGObject], [encryptionCertificate UTF8String]);
}

- (void)setSignByDefault:(bool)signByDefault
{
	e_source_smime_set_sign_by_default([self castedGObject], signByDefault);
}

- (void)setSigningAlgorithm:(OFString*)signingAlgorithm
{
	e_source_smime_set_signing_algorithm([self castedGObject], [signingAlgorithm UTF8String]);
}

- (void)setSigningCertificate:(OFString*)signingCertificate
{
	e_source_smime_set_signing_certificate([self castedGObject], [signingCertificate UTF8String]);
}


@end