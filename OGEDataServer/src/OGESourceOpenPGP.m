/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceOpenPGP.h"

@implementation OGESourceOpenPGP

- (ESourceOpenPGP*)castedGObject
{
	return E_SOURCE_OPENPGP([self gObject]);
}

- (OFString*)dupKeyId
{
	gchar* gobjectValue = e_source_openpgp_dup_key_id([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupSigningAlgorithm
{
	gchar* gobjectValue = e_source_openpgp_dup_signing_algorithm([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (bool)alwaysTrust
{
	bool returnValue = e_source_openpgp_get_always_trust([self castedGObject]);

	return returnValue;
}

- (bool)encryptByDefault
{
	bool returnValue = e_source_openpgp_get_encrypt_by_default([self castedGObject]);

	return returnValue;
}

- (bool)encryptToSelf
{
	bool returnValue = e_source_openpgp_get_encrypt_to_self([self castedGObject]);

	return returnValue;
}

- (OFString*)keyId
{
	const gchar* gobjectValue = e_source_openpgp_get_key_id([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)locateKeys
{
	bool returnValue = e_source_openpgp_get_locate_keys([self castedGObject]);

	return returnValue;
}

- (bool)preferInline
{
	bool returnValue = e_source_openpgp_get_prefer_inline([self castedGObject]);

	return returnValue;
}

- (bool)sendPreferEncrypt
{
	bool returnValue = e_source_openpgp_get_send_prefer_encrypt([self castedGObject]);

	return returnValue;
}

- (bool)sendPublicKey
{
	bool returnValue = e_source_openpgp_get_send_public_key([self castedGObject]);

	return returnValue;
}

- (bool)signByDefault
{
	bool returnValue = e_source_openpgp_get_sign_by_default([self castedGObject]);

	return returnValue;
}

- (OFString*)signingAlgorithm
{
	const gchar* gobjectValue = e_source_openpgp_get_signing_algorithm([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setAlwaysTrust:(bool)alwaysTrust
{
	e_source_openpgp_set_always_trust([self castedGObject], alwaysTrust);
}

- (void)setEncryptByDefault:(bool)encryptByDefault
{
	e_source_openpgp_set_encrypt_by_default([self castedGObject], encryptByDefault);
}

- (void)setEncryptToSelf:(bool)encryptToSelf
{
	e_source_openpgp_set_encrypt_to_self([self castedGObject], encryptToSelf);
}

- (void)setKeyId:(OFString*)keyId
{
	e_source_openpgp_set_key_id([self castedGObject], [keyId UTF8String]);
}

- (void)setLocateKeys:(bool)locateKeys
{
	e_source_openpgp_set_locate_keys([self castedGObject], locateKeys);
}

- (void)setPreferInline:(bool)preferInline
{
	e_source_openpgp_set_prefer_inline([self castedGObject], preferInline);
}

- (void)setSendPreferEncrypt:(bool)sendPreferEncrypt
{
	e_source_openpgp_set_send_prefer_encrypt([self castedGObject], sendPreferEncrypt);
}

- (void)setSendPublicKey:(bool)sendPublicKey
{
	e_source_openpgp_set_send_public_key([self castedGObject], sendPublicKey);
}

- (void)setSignByDefault:(bool)signByDefault
{
	e_source_openpgp_set_sign_by_default([self castedGObject], signByDefault);
}

- (void)setSigningAlgorithm:(OFString*)signingAlgorithm
{
	e_source_openpgp_set_signing_algorithm([self castedGObject], [signingAlgorithm UTF8String]);
}


@end