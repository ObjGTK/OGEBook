/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceSMIME.h"

@implementation OGESourceSMIME

- (ESourceSMIME*)SOURCESMIME
{
	return E_SOURCE_SMIME([self GOBJECT]);
}

- (OFString*)dupEncryptionCertificate
{
	return [OFString stringWithUTF8String:e_source_smime_dup_encryption_certificate([self SOURCESMIME])];
}

- (OFString*)dupSigningAlgorithm
{
	return [OFString stringWithUTF8String:e_source_smime_dup_signing_algorithm([self SOURCESMIME])];
}

- (OFString*)dupSigningCertificate
{
	return [OFString stringWithUTF8String:e_source_smime_dup_signing_certificate([self SOURCESMIME])];
}

- (bool)encryptByDefault
{
	return e_source_smime_get_encrypt_by_default([self SOURCESMIME]);
}

- (bool)encryptToSelf
{
	return e_source_smime_get_encrypt_to_self([self SOURCESMIME]);
}

- (OFString*)encryptionCertificate
{
	return [OFString stringWithUTF8String:e_source_smime_get_encryption_certificate([self SOURCESMIME])];
}

- (bool)signByDefault
{
	return e_source_smime_get_sign_by_default([self SOURCESMIME]);
}

- (OFString*)signingAlgorithm
{
	return [OFString stringWithUTF8String:e_source_smime_get_signing_algorithm([self SOURCESMIME])];
}

- (OFString*)signingCertificate
{
	return [OFString stringWithUTF8String:e_source_smime_get_signing_certificate([self SOURCESMIME])];
}

- (void)setEncryptByDefault:(bool)encryptByDefault
{
	e_source_smime_set_encrypt_by_default([self SOURCESMIME], encryptByDefault);
}

- (void)setEncryptToSelf:(bool)encryptToSelf
{
	e_source_smime_set_encrypt_to_self([self SOURCESMIME], encryptToSelf);
}

- (void)setEncryptionCertificate:(OFString*)encryptionCertificate
{
	e_source_smime_set_encryption_certificate([self SOURCESMIME], [encryptionCertificate UTF8String]);
}

- (void)setSignByDefault:(bool)signByDefault
{
	e_source_smime_set_sign_by_default([self SOURCESMIME], signByDefault);
}

- (void)setSigningAlgorithm:(OFString*)signingAlgorithm
{
	e_source_smime_set_signing_algorithm([self SOURCESMIME], [signingAlgorithm UTF8String]);
}

- (void)setSigningCertificate:(OFString*)signingCertificate
{
	e_source_smime_set_signing_certificate([self SOURCESMIME], [signingCertificate UTF8String]);
}


@end