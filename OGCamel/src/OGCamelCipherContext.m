/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelCipherContext.h"

#import "OGCamelMimePart.h"
#import "OGCamelSession.h"
#import <OGio/OGCancellable.h>

@implementation OGCamelCipherContext

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_CIPHER_CONTEXT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GQuark)errorQuark
{
	GQuark returnValue = (GQuark)camel_cipher_context_error_quark();

	return returnValue;
}

+ (instancetype)cipherContext:(OGCamelSession*)session
{
	CamelCipherContext* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_cipher_context_new([session castedGObject]), CamelCipherContext, CamelCipherContext);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelCipherContext* wrapperObject;
	@try {
		wrapperObject = [[OGCamelCipherContext alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelCipherContext*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelCipherContext, CamelCipherContext);
}

- (void)decryptWithIpart:(OGCamelMimePart*)ipart opart:(OGCamelMimePart*)opart ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_cipher_context_decrypt([self castedGObject], [ipart castedGObject], [opart castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (CamelCipherValidity*)decryptFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	CamelCipherValidity* returnValue = (CamelCipherValidity*)camel_cipher_context_decrypt_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (CamelCipherValidity*)decryptSyncWithIpart:(OGCamelMimePart*)ipart opart:(OGCamelMimePart*)opart cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	CamelCipherValidity* returnValue = (CamelCipherValidity*)camel_cipher_context_decrypt_sync([self castedGObject], [ipart castedGObject], [opart castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)encryptWithUserid:(OFString*)userid recipients:(GPtrArray*)recipients ipart:(OGCamelMimePart*)ipart opart:(OGCamelMimePart*)opart ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_cipher_context_encrypt([self castedGObject], [userid UTF8String], recipients, [ipart castedGObject], [opart castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)encryptFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)camel_cipher_context_encrypt_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)encryptSyncWithUserid:(OFString*)userid recipients:(GPtrArray*)recipients ipart:(OGCamelMimePart*)ipart opart:(OGCamelMimePart*)opart cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)camel_cipher_context_encrypt_sync([self castedGObject], [userid UTF8String], recipients, [ipart castedGObject], [opart castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (OGCamelSession*)session
{
	CamelSession* gobjectValue = camel_cipher_context_get_session([self castedGObject]);

	OGCamelSession* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OFString*)hashToId:(CamelCipherHash)hash
{
	const gchar* gobjectValue = camel_cipher_context_hash_to_id([self castedGObject], hash);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (CamelCipherHash)idToHash:(OFString*)identifier
{
	CamelCipherHash returnValue = (CamelCipherHash)camel_cipher_context_id_to_hash([self castedGObject], [identifier UTF8String]);

	return returnValue;
}

- (void)signWithUserid:(OFString*)userid hash:(CamelCipherHash)hash ipart:(OGCamelMimePart*)ipart opart:(OGCamelMimePart*)opart ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_cipher_context_sign([self castedGObject], [userid UTF8String], hash, [ipart castedGObject], [opart castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)signFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)camel_cipher_context_sign_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)signSyncWithUserid:(OFString*)userid hash:(CamelCipherHash)hash ipart:(OGCamelMimePart*)ipart opart:(OGCamelMimePart*)opart cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)camel_cipher_context_sign_sync([self castedGObject], [userid UTF8String], hash, [ipart castedGObject], [opart castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)verifyWithIpart:(OGCamelMimePart*)ipart ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_cipher_context_verify([self castedGObject], [ipart castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (CamelCipherValidity*)verifyFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	CamelCipherValidity* returnValue = (CamelCipherValidity*)camel_cipher_context_verify_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (CamelCipherValidity*)verifySyncWithIpart:(OGCamelMimePart*)ipart cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	CamelCipherValidity* returnValue = (CamelCipherValidity*)camel_cipher_context_verify_sync([self castedGObject], [ipart castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}


@end