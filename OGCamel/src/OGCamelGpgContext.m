/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelGpgContext.h"

#import <OGio/OGCancellable.h>
#import "OGCamelSession.h"

@implementation OGCamelGpgContext

- (instancetype)init:(OGCamelSession*)session
{
	CamelGpgContext* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_gpg_context_new([session castedGObject]), CamelGpgContext, CamelGpgContext);

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (CamelGpgContext*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelGpgContext, CamelGpgContext);
}

- (bool)alwaysTrust
{
	bool returnValue = camel_gpg_context_get_always_trust([self castedGObject]);

	return returnValue;
}

- (bool)keyDataInfoSyncWithData:(const guint8*)data dataSize:(gsize)dataSize flags:(guint32)flags outInfos:(GSList**)outInfos cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = camel_gpg_context_get_key_data_info_sync([self castedGObject], data, dataSize, flags, outInfos, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)locateKeys
{
	bool returnValue = camel_gpg_context_get_locate_keys([self castedGObject]);

	return returnValue;
}

- (bool)preferInline
{
	bool returnValue = camel_gpg_context_get_prefer_inline([self castedGObject]);

	return returnValue;
}

- (bool)publicKeyInfoSyncWithKeyid:(OFString*)keyid flags:(guint32)flags outInfos:(GSList**)outInfos cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = camel_gpg_context_get_public_key_info_sync([self castedGObject], [keyid UTF8String], flags, outInfos, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)publicKeySyncWithKeyid:(OFString*)keyid flags:(guint32)flags outData:(guint8**)outData outDataSize:(gsize*)outDataSize cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = camel_gpg_context_get_public_key_sync([self castedGObject], [keyid UTF8String], flags, outData, outDataSize, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)hasPublicKeySyncWithKeyid:(OFString*)keyid cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = camel_gpg_context_has_public_key_sync([self castedGObject], [keyid UTF8String], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)importKeySyncWithData:(const guint8*)data dataSize:(gsize)dataSize flags:(guint32)flags cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = camel_gpg_context_import_key_sync([self castedGObject], data, dataSize, flags, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)setAlwaysTrust:(bool)alwaysTrust
{
	camel_gpg_context_set_always_trust([self castedGObject], alwaysTrust);
}

- (bool)setKeyTrustSyncWithKeyid:(OFString*)keyid trust:(CamelGpgTrust)trust cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = camel_gpg_context_set_key_trust_sync([self castedGObject], [keyid UTF8String], trust, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)setLocateKeys:(bool)locateKeys
{
	camel_gpg_context_set_locate_keys([self castedGObject], locateKeys);
}

- (void)setPreferInline:(bool)preferInline
{
	camel_gpg_context_set_prefer_inline([self castedGObject], preferInline);
}


@end