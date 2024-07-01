/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEBookClientView.h"

#import <OGio/OGDBusConnection.h>
#import "OGEBookClient.h"

@implementation OGEBookClientView

- (EBookClientView*)castedGObject
{
	return E_BOOK_CLIENT_VIEW([self gObject]);
}

- (OGEBookClient*)client
{
	EBookClient* gobjectValue = E_BOOK_CLIENT(e_book_client_view_get_client([self castedGObject]));

	OGEBookClient* returnValue = [OGEBookClient withGObject:gobjectValue];
	return returnValue;
}

- (OGDBusConnection*)connection
{
	GDBusConnection* gobjectValue = G_DBUS_CONNECTION(e_book_client_view_get_connection([self castedGObject]));

	OGDBusConnection* returnValue = [OGDBusConnection withGObject:gobjectValue];
	return returnValue;
}

- (OFString*)objectPath
{
	const gchar* gobjectValue = e_book_client_view_get_object_path([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)isRunning
{
	bool returnValue = e_book_client_view_is_running([self castedGObject]);

	return returnValue;
}

- (OGEBookClient*)refClient
{
	EBookClient* gobjectValue = E_BOOK_CLIENT(e_book_client_view_ref_client([self castedGObject]));

	OGEBookClient* returnValue = [OGEBookClient withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)setFieldsOfInterest:(const GSList*)fieldsOfInterest
{
	GError* err = NULL;

	e_book_client_view_set_fields_of_interest([self castedGObject], fieldsOfInterest, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

}

- (void)setFlags:(EBookClientViewFlags)flags
{
	GError* err = NULL;

	e_book_client_view_set_flags([self castedGObject], flags, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

}

- (void)start
{
	GError* err = NULL;

	e_book_client_view_start([self castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

}

- (void)stop
{
	GError* err = NULL;

	e_book_client_view_stop([self castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

}


@end