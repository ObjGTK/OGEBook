/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelDataCache.h"

#import <OGio/OGIOStream.h>

@implementation OGCamelDataCache

- (instancetype)init:(OFString*)path
{
	GError* err = NULL;

	CamelDataCache* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_data_cache_new([path UTF8String], &err), CamelDataCache, CamelDataCache);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		if(gobjectValue != NULL)
			g_object_unref(gobjectValue);
		@throw exception;
	}

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

- (CamelDataCache*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelDataCache, CamelDataCache);
}

- (OGIOStream*)addWithPath:(OFString*)path key:(OFString*)key
{
	GError* err = NULL;

	GIOStream* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_data_cache_add([self castedGObject], [path UTF8String], [key UTF8String], &err), GIOStream, GIOStream);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		if(gobjectValue != NULL)
			g_object_unref(gobjectValue);
		@throw exception;
	}

	OGIOStream* returnValue = [OGIOStream withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)clear:(OFString*)path
{
	camel_data_cache_clear([self castedGObject], [path UTF8String]);
}

- (void)foreachRemoveWithPath:(OFString*)path func:(CamelDataCacheRemoveFunc)func userData:(gpointer)userData
{
	camel_data_cache_foreach_remove([self castedGObject], [path UTF8String], func, userData);
}

- (OGIOStream*)getWithPath:(OFString*)path key:(OFString*)key
{
	GError* err = NULL;

	GIOStream* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_data_cache_get([self castedGObject], [path UTF8String], [key UTF8String], &err), GIOStream, GIOStream);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		if(gobjectValue != NULL)
			g_object_unref(gobjectValue);
		@throw exception;
	}

	OGIOStream* returnValue = [OGIOStream withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (bool)expireEnabled
{
	bool returnValue = camel_data_cache_get_expire_enabled([self castedGObject]);

	return returnValue;
}

- (OFString*)filenameWithPath:(OFString*)path key:(OFString*)key
{
	gchar* gobjectValue = camel_data_cache_get_filename([self castedGObject], [path UTF8String], [key UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)path
{
	const gchar* gobjectValue = camel_data_cache_get_path([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (gint)removeWithPath:(OFString*)path key:(OFString*)key
{
	GError* err = NULL;

	gint returnValue = camel_data_cache_remove([self castedGObject], [path UTF8String], [key UTF8String], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)setExpireAccess:(time_t)when
{
	camel_data_cache_set_expire_access([self castedGObject], when);
}

- (void)setExpireAge:(time_t)when
{
	camel_data_cache_set_expire_age([self castedGObject], when);
}

- (void)setExpireEnabled:(bool)expireEnabled
{
	camel_data_cache_set_expire_enabled([self castedGObject], expireEnabled);
}

- (void)setPath:(OFString*)path
{
	camel_data_cache_set_path([self castedGObject], [path UTF8String]);
}


@end