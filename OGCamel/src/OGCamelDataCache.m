/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelDataCache.h"

@implementation OGCamelDataCache

- (instancetype)initWithPath:(OFString*)path err:(GError**)err
{
	self = [super initWithGObject:(GObject*)camel_data_cache_new([path UTF8String], err)];

	return self;
}

- (CamelDataCache*)DATACACHE
{
	return CAMEL_DATA_CACHE([self GOBJECT]);
}

- (GIOStream*)addWithPath:(OFString*)path key:(OFString*)key err:(GError**)err
{
	return camel_data_cache_add([self DATACACHE], [path UTF8String], [key UTF8String], err);
}

- (void)clear:(OFString*)path
{
	camel_data_cache_clear([self DATACACHE], [path UTF8String]);
}

- (void)foreachRemoveWithPath:(OFString*)path func:(CamelDataCacheRemoveFunc)func userData:(gpointer)userData
{
	camel_data_cache_foreach_remove([self DATACACHE], [path UTF8String], func, userData);
}

- (GIOStream*)instanceWithPath:(OFString*)path key:(OFString*)key err:(GError**)err
{
	return camel_data_cache_get([self DATACACHE], [path UTF8String], [key UTF8String], err);
}

- (bool)expireEnabled
{
	return camel_data_cache_get_expire_enabled([self DATACACHE]);
}

- (OFString*)filenameWithPath:(OFString*)path key:(OFString*)key
{
	return [OFString stringWithUTF8String:camel_data_cache_get_filename([self DATACACHE], [path UTF8String], [key UTF8String])];
}

- (OFString*)path
{
	return [OFString stringWithUTF8String:camel_data_cache_get_path([self DATACACHE])];
}

- (gint)removeWithPath:(OFString*)path key:(OFString*)key err:(GError**)err
{
	return camel_data_cache_remove([self DATACACHE], [path UTF8String], [key UTF8String], err);
}

- (void)setExpireAccess:(time_t)when
{
	camel_data_cache_set_expire_access([self DATACACHE], when);
}

- (void)setExpireAge:(time_t)when
{
	camel_data_cache_set_expire_age([self DATACACHE], when);
}

- (void)setExpireEnabled:(bool)expireEnabled
{
	camel_data_cache_set_expire_enabled([self DATACACHE], expireEnabled);
}

- (void)setPath:(OFString*)path
{
	camel_data_cache_set_path([self DATACACHE], [path UTF8String]);
}


@end