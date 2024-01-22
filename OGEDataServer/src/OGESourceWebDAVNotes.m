/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceWebDAVNotes.h"

@implementation OGESourceWebDAVNotes

- (ESourceWebDAVNotes*)castedGObject
{
	return E_SOURCE_WEBDAV_NOTES([self gObject]);
}

- (OFString*)dupDefaultExt
{
	gchar* gobjectValue = e_source_webdav_notes_dup_default_ext([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)defaultExt
{
	const gchar* gobjectValue = e_source_webdav_notes_get_default_ext([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setDefaultExt:(OFString*)defaultExt
{
	e_source_webdav_notes_set_default_ext([self castedGObject], [defaultExt UTF8String]);
}


@end