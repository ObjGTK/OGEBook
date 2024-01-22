/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelLocalSettings.h"

@implementation OGCamelLocalSettings

- (CamelLocalSettings*)castedGObject
{
	return CAMEL_LOCAL_SETTINGS([self gObject]);
}

- (OFString*)dupPath
{
	gchar* gobjectValue = camel_local_settings_dup_path([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (bool)filterAll
{
	bool returnValue = camel_local_settings_get_filter_all([self castedGObject]);

	return returnValue;
}

- (bool)filterJunk
{
	bool returnValue = camel_local_settings_get_filter_junk([self castedGObject]);

	return returnValue;
}

- (bool)maildirAltFlagSep
{
	bool returnValue = camel_local_settings_get_maildir_alt_flag_sep([self castedGObject]);

	return returnValue;
}

- (OFString*)path
{
	const gchar* gobjectValue = camel_local_settings_get_path([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setFilterAll:(bool)filterAll
{
	camel_local_settings_set_filter_all([self castedGObject], filterAll);
}

- (void)setFilterJunk:(bool)filterJunk
{
	camel_local_settings_set_filter_junk([self castedGObject], filterJunk);
}

- (void)setMaildirAltFlagSep:(bool)maildirAltFlagSep
{
	camel_local_settings_set_maildir_alt_flag_sep([self castedGObject], maildirAltFlagSep);
}

- (void)setPath:(OFString*)path
{
	camel_local_settings_set_path([self castedGObject], [path UTF8String]);
}


@end