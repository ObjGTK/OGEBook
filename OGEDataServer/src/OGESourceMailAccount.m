/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceMailAccount.h"

@implementation OGESourceMailAccount

- (ESourceMailAccount*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceMailAccount, ESourceMailAccount);
}

- (OFString*)dupArchiveFolder
{
	gchar* gobjectValue = e_source_mail_account_dup_archive_folder([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupIdentityUid
{
	gchar* gobjectValue = e_source_mail_account_dup_identity_uid([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)archiveFolder
{
	const gchar* gobjectValue = e_source_mail_account_get_archive_folder([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)builtin
{
	bool returnValue = e_source_mail_account_get_builtin([self castedGObject]);

	return returnValue;
}

- (OFString*)identityUid
{
	const gchar* gobjectValue = e_source_mail_account_get_identity_uid([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (EThreeState)markSeen
{
	EThreeState returnValue = e_source_mail_account_get_mark_seen([self castedGObject]);

	return returnValue;
}

- (gint)markSeenTimeout
{
	gint returnValue = e_source_mail_account_get_mark_seen_timeout([self castedGObject]);

	return returnValue;
}

- (bool)needsInitialSetup
{
	bool returnValue = e_source_mail_account_get_needs_initial_setup([self castedGObject]);

	return returnValue;
}

- (void)setArchiveFolder:(OFString*)archiveFolder
{
	e_source_mail_account_set_archive_folder([self castedGObject], [archiveFolder UTF8String]);
}

- (void)setBuiltin:(gint)builtin
{
	e_source_mail_account_set_builtin([self castedGObject], builtin);
}

- (void)setIdentityUid:(OFString*)identityUid
{
	e_source_mail_account_set_identity_uid([self castedGObject], [identityUid UTF8String]);
}

- (void)setMarkSeen:(EThreeState)markSeen
{
	e_source_mail_account_set_mark_seen([self castedGObject], markSeen);
}

- (void)setMarkSeenTimeout:(gint)timeout
{
	e_source_mail_account_set_mark_seen_timeout([self castedGObject], timeout);
}

- (void)setNeedsInitialSetup:(bool)needsInitialSetup
{
	e_source_mail_account_set_needs_initial_setup([self castedGObject], needsInitialSetup);
}


@end