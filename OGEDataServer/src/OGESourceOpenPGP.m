/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceOpenPGP.h"

@implementation OGESourceOpenPGP

- (ESourceOpenPGP*)SOURCEOPENPGP
{
	return E_SOURCE_OPENPGP([self GOBJECT]);
}

- (OFString*)dupKeyId
{
	return [OFString stringWithUTF8String:e_source_openpgp_dup_key_id([self SOURCEOPENPGP])];
}

- (OFString*)dupSigningAlgorithm
{
	return [OFString stringWithUTF8String:e_source_openpgp_dup_signing_algorithm([self SOURCEOPENPGP])];
}

- (bool)alwaysTrust
{
	return e_source_openpgp_get_always_trust([self SOURCEOPENPGP]);
}

- (bool)encryptByDefault
{
	return e_source_openpgp_get_encrypt_by_default([self SOURCEOPENPGP]);
}

- (bool)encryptToSelf
{
	return e_source_openpgp_get_encrypt_to_self([self SOURCEOPENPGP]);
}

- (OFString*)keyId
{
	return [OFString stringWithUTF8String:e_source_openpgp_get_key_id([self SOURCEOPENPGP])];
}

- (bool)preferInline
{
	return e_source_openpgp_get_prefer_inline([self SOURCEOPENPGP]);
}

- (bool)signByDefault
{
	return e_source_openpgp_get_sign_by_default([self SOURCEOPENPGP]);
}

- (OFString*)signingAlgorithm
{
	return [OFString stringWithUTF8String:e_source_openpgp_get_signing_algorithm([self SOURCEOPENPGP])];
}

- (void)setAlwaysTrust:(bool)alwaysTrust
{
	e_source_openpgp_set_always_trust([self SOURCEOPENPGP], alwaysTrust);
}

- (void)setEncryptByDefault:(bool)encryptByDefault
{
	e_source_openpgp_set_encrypt_by_default([self SOURCEOPENPGP], encryptByDefault);
}

- (void)setEncryptToSelf:(bool)encryptToSelf
{
	e_source_openpgp_set_encrypt_to_self([self SOURCEOPENPGP], encryptToSelf);
}

- (void)setKeyId:(OFString*)keyId
{
	e_source_openpgp_set_key_id([self SOURCEOPENPGP], [keyId UTF8String]);
}

- (void)setPreferInline:(bool)preferInline
{
	e_source_openpgp_set_prefer_inline([self SOURCEOPENPGP], preferInline);
}

- (void)setSignByDefault:(bool)signByDefault
{
	e_source_openpgp_set_sign_by_default([self SOURCEOPENPGP], signByDefault);
}

- (void)setSigningAlgorithm:(OFString*)signingAlgorithm
{
	e_source_openpgp_set_signing_algorithm([self SOURCEOPENPGP], [signingAlgorithm UTF8String]);
}


@end