/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEBookClientView.h"

#import "OGEBookClient.h"

@implementation OGEBookClientView

- (EBookClientView*)BOOKCLIENTVIEW
{
	return E_BOOK_CLIENT_VIEW([self GOBJECT]);
}

- (OGEBookClient*)client
{
	return [[[OGEBookClient alloc] initWithGObject:(GObject*)e_book_client_view_get_client([self BOOKCLIENTVIEW])] autorelease];
}

- (GDBusConnection*)connection
{
	return e_book_client_view_get_connection([self BOOKCLIENTVIEW]);
}

- (OFString*)objectPath
{
	return [OFString stringWithUTF8String:e_book_client_view_get_object_path([self BOOKCLIENTVIEW])];
}

- (bool)isRunning
{
	return e_book_client_view_is_running([self BOOKCLIENTVIEW]);
}

- (OGEBookClient*)refClient
{
	return [[[OGEBookClient alloc] initWithGObject:(GObject*)e_book_client_view_ref_client([self BOOKCLIENTVIEW])] autorelease];
}

- (void)setFieldsOfInterestWithFieldsOfInterest:(const GSList*)fieldsOfInterest err:(GError**)err
{
	e_book_client_view_set_fields_of_interest([self BOOKCLIENTVIEW], fieldsOfInterest, err);
}

- (void)setFlagsWithFlags:(EBookClientViewFlags)flags err:(GError**)err
{
	e_book_client_view_set_flags([self BOOKCLIENTVIEW], flags, err);
}

- (void)start:(GError**)err
{
	e_book_client_view_start([self BOOKCLIENTVIEW], err);
}

- (void)stop:(GError**)err
{
	e_book_client_view_stop([self BOOKCLIENTVIEW], err);
}


@end