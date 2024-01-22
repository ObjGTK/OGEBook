/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelCipherContext.h"

@class OGCamelSession;
@class OGCancellable;

@interface OGCamelGpgContext : OGCamelCipherContext
{

}


/**
 * Constructors
 */
- (instancetype)init:(OGCamelSession*)session;

/**
 * Methods
 */

- (CamelGpgContext*)castedGObject;

/**
 *
 * @return
 */
- (bool)alwaysTrust;

/**
 * Receives information about a key stored in @data of size @data_size.
 * 
 * The @flags argument is currently unused and should be set to 0.
 * 
 * Free the returned @out_infos with g_slist_free_full (infos, camel_gpg_key_info_free);
 * when no longer needed.
 *
 * @param data the public key data
 * @param dataSize the @data size
 * @param flags flags for the operation
 * @param outInfos an out parameter to get #GSList of #CamelGpgKeyInfo structures
 * @param cancellable optional #GCancellable object, or %NULL
 * @return whether succeeded
 */
- (bool)keyDataInfoSyncWithData:(const guint8*)data dataSize:(gsize)dataSize flags:(guint32)flags outInfos:(GSList**)outInfos cancellable:(OGCancellable*)cancellable;

/**
 * Returns, whether gpg can locate keys using Web Key Directory (WKD) lookup
 * when encrypting messages. The default is %TRUE.
 *
 * @return whether gpg can locate keys using Web Key Directory (WKD) lookup
 *    when encrypting messages.
 */
- (bool)locateKeys;

/**
 *
 * @return Whether prefer inline sign/encrypt (%TRUE), or as multiparts (%FALSE)
 */
- (bool)preferInline;

/**
 * Receives information about a key @keyid.
 * 
 * The @keyid can be either key ID or an email address.
 * 
 * The @flags argument is currently unused and should be set to 0.
 * 
 * Free the returned @out_infos with g_slist_free_full (infos, camel_gpg_key_info_free);
 * when no longer needed.
 *
 * @param keyid a key ID or an email address
 * @param flags flags for the operation
 * @param outInfos an out parameter to get #GSList of #CamelGpgKeyInfo structures
 * @param cancellable optional #GCancellable object, or %NULL
 * @return whether succeeded
 */
- (bool)publicKeyInfoSyncWithKeyid:(OFString*)keyid flags:(guint32)flags outInfos:(GSList**)outInfos cancellable:(OGCancellable*)cancellable;

/**
 * Returns a public key with @keyid.
 * 
 * The @keyid can be either key ID or an email address.
 * 
 * The @flags argument is currently unused and should be set to 0.
 * 
 * The @out_data content should be freed with g_free(), when
 * no longer needed.
 *
 * @param keyid a key ID or an email address
 * @param flags flags for the operation
 * @param outData return location for the public key data, in binary form
 * @param outDataSize return location to store the @out_data size to
 * @param cancellable optional #GCancellable object, or %NULL
 * @return whether succeeded
 */
- (bool)publicKeySyncWithKeyid:(OFString*)keyid flags:(guint32)flags outData:(guint8**)outData outDataSize:(gsize*)outDataSize cancellable:(OGCancellable*)cancellable;

/**
 * Checks whether there exists a public key with @keyid.
 * 
 * The @keyid can be either key ID or an email address.
 *
 * @param keyid a key ID or an email address
 * @param cancellable optional #GCancellable object, or %NULL
 * @return whether the key could be found
 */
- (bool)hasPublicKeySyncWithKeyid:(OFString*)keyid cancellable:(OGCancellable*)cancellable;

/**
 * Imports a (public) key provided in a binary form stored in the @data
 * of size @data_size.
 *
 * @param data the public key data
 * @param dataSize the @data size
 * @param flags bit-or of CamelPgpImportFlags, flags for the operation
 * @param cancellable optional #GCancellable object, or %NULL
 * @return whether succeeded
 */
- (bool)importKeySyncWithData:(const guint8*)data dataSize:(gsize)dataSize flags:(guint32)flags cancellable:(OGCancellable*)cancellable;

/**
 * Sets the @always_trust flag on the gpg context which is used for
 * encryption.
 *
 * @param alwaysTrust always trust flag
 */
- (void)setAlwaysTrust:(bool)alwaysTrust;

/**
 * Sets @trust level on the key @keyid.
 * 
 * The @keyid can be either key ID or an email address.
 *
 * @param keyid a key ID or an email address
 * @param trust a #CamelGpgTrust to set
 * @param cancellable optional #GCancellable object, or %NULL
 * @return whether succeeded
 */
- (bool)setKeyTrustSyncWithKeyid:(OFString*)keyid trust:(CamelGpgTrust)trust cancellable:(OGCancellable*)cancellable;

/**
 * Sets the @locate_keys on the gpg context which is used to instruct
 * gpg to locate keys using Web Key Directory (WKD) lookup when encrypting
 * messages.
 *
 * @param locateKeys value to set
 */
- (void)setLocateKeys:(bool)locateKeys;

/**
 * Sets the @prefer_inline flag on the gpg context.
 *
 * @param preferInline whether prefer inline sign/encrypt
 */
- (void)setPreferInline:(bool)preferInline;

@end