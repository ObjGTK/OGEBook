/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceExtension.h"

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGESourceOpenPGP : OGESourceExtension
{

}


/**
 * Methods
 */

- (ESourceOpenPGP*)castedGObject;

/**
 * Thread-safe variation of e_source_openpgp_get_key_id().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceOpenPGP:key-id
 */
- (OFString*)dupKeyId;

/**
 * Thread-safe variation of e_source_openpgp_get_signing_algorithm().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceOpenPGP:signing-algorithm
 */
- (OFString*)dupSigningAlgorithm;

/**
 * Returns whether to skip key validation and assume that used keys are
 * always fully trusted.
 *
 * @return whether used keys are always fully trusted
 */
- (bool)alwaysTrust;

/**
 * Returns whether to digitally encrypt outgoing messages by default using
 * OpenPGP-compliant software such as GNU Privacy Guard (GnuPG).
 *
 * @return whether to encrypt outgoing messages by default
 */
- (bool)encryptByDefault;

/**
 * Returns whether to "encrypt-to-self" when sending encrypted messages.
 *
 * @return whether to "encrypt-to-self"
 */
- (bool)encryptToSelf;

/**
 * Returns the OpenPGP key ID used to sign and encrypt messages.
 *
 * @return the key ID used to sign and encrypt messages
 */
- (OFString*)keyId;

/**
 * Returns, whether gpg can locate keys using Web Key Directory (WKD) lookup
 * when encrypting messages. The default is %TRUE.
 *
 * @return whether gpg can locate keys using Web Key Directory (WKD) lookup
 *    when encrypting messages.
 */
- (bool)locateKeys;

/**
 * Returns whether to prefer inline sign/encrypt of the text/plain messages.
 *
 * @return whether to prefer inline sign/encrypt of the text/plain messages
 */
- (bool)preferInline;

/**
 * Returns, whether should claim the encryption is preferred when sending
 * public key in messages. The default is %TRUE.
 *
 * @return whether should claim the encryption is preferred when sending
 *    public key in messages
 */
- (bool)sendPreferEncrypt;

/**
 * Returns, whether should send GPG public key in messages. The default is %TRUE.
 *
 * @return whether should send GPG public key in messages
 */
- (bool)sendPublicKey;

/**
 * Returns whether to digitally sign outgoing messages by default using
 * OpenPGP-compliant software such as GNU Privacy Guard (GnuPG).
 *
 * @return whether to sign outgoing messages by default
 */
- (bool)signByDefault;

/**
 * Returns the name of the hash algorithm used to digitally sign outgoing
 * messages.
 *
 * @return the signing algorithm for outgoing messages
 */
- (OFString*)signingAlgorithm;

/**
 * Sets whether to skip key validation and assume that used keys are
 * always fully trusted.
 *
 * @param alwaysTrust whether used keys are always fully trusted
 */
- (void)setAlwaysTrust:(bool)alwaysTrust;

/**
 * Sets whether to digitally encrypt outgoing messages by default using
 * OpenPGP-compliant software such as GNU Privacy Guard (GnuPG).
 *
 * @param encryptByDefault whether to encrypt outgoing messages by default
 */
- (void)setEncryptByDefault:(bool)encryptByDefault;

/**
 * Sets whether to "encrypt-to-self" when sending encrypted messages.
 *
 * @param encryptToSelf whether to "encrypt-to-self"
 */
- (void)setEncryptToSelf:(bool)encryptToSelf;

/**
 * Sets the OpenPGP key ID used to sign and encrypt messages.
 * 
 * The internal copy of @key_id is automatically stripped of leading and
 * trailing whitespace.  If the resulting string is empty, %NULL is set
 * instead.
 *
 * @param keyId the key ID used to sign and encrypt messages
 */
- (void)setKeyId:(OFString*)keyId;

/**
 * Sets the @locate_keys on the @extension, which is used to instruct
 * gpg to locate keys using Web Key Directory (WKD) lookup when encrypting
 * messages.
 *
 * @param locateKeys value to set
 */
- (void)setLocateKeys:(bool)locateKeys;

/**
 * Sets whether to prefer inline sign/encrypt of the text/plain messages.
 *
 * @param preferInline whether to prefer inline sign/encrypt of the text/plain messages
 */
- (void)setPreferInline:(bool)preferInline;

/**
 * Sets the @send_prefer_encrypt on the @extension, which tells the client to
 * claim the user prefer encryption when also sending its public key in
 * the messages (e_source_openpgp_set_send_public_key()).
 *
 * @param sendPreferEncrypt value to set
 */
- (void)setSendPreferEncrypt:(bool)sendPreferEncrypt;

/**
 * Sets the @send_public_key on the @extension, which tells the client to
 * include user's public key in the messages in an Autocrypt header.
 *
 * @param sendPublicKey value to set
 */
- (void)setSendPublicKey:(bool)sendPublicKey;

/**
 * Sets whether to digitally sign outgoing messages by default using
 * OpenPGP-compliant software such as GNU Privacy Guard (GnuPG).
 *
 * @param signByDefault whether to sign outgoing messages by default
 */
- (void)setSignByDefault:(bool)signByDefault;

/**
 * Sets the name of the hash algorithm used to digitally sign outgoing
 * messages.
 * 
 * The internal copy of @signing_algorithm is automatically stripped of
 * leading and trailing whitespace.  If the resulting string is empty,
 * %NULL is set instead.
 *
 * @param signingAlgorithm the signing algorithm for outgoing messages
 */
- (void)setSigningAlgorithm:(OFString*)signingAlgorithm;

@end