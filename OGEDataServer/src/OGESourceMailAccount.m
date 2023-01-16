/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceMailAccount.h"

@implementation OGESourceMailAccount

- (ESourceMailAccount*)SOURCEMAILACCOUNT
{
	return E_SOURCE_MAIL_ACCOUNT([self GOBJECT]);
}

- (OFString*)dupArchiveFolder
{
	return [OFString stringWithUTF8String:e_source_mail_account_dup_archive_folder([self SOURCEMAILACCOUNT])];
}

- (OFString*)dupIdentityUid
{
	return [OFString stringWithUTF8String:e_source_mail_account_dup_identity_uid([self SOURCEMAILACCOUNT])];
}

- (OFString*)archiveFolder
{
	return [OFString stringWithUTF8String:e_source_mail_account_get_archive_folder([self SOURCEMAILACCOUNT])];
}

- (OFString*)identityUid
{
	return [OFString stringWithUTF8String:e_source_mail_account_get_identity_uid([self SOURCEMAILACCOUNT])];
}

- (EThreeState)markSeen
{
	return e_source_mail_account_get_mark_seen([self SOURCEMAILACCOUNT]);
}

- (gint)markSeenTimeout
{
	return e_source_mail_account_get_mark_seen_timeout([self SOURCEMAILACCOUNT]);
}

- (bool)needsInitialSetup
{
	return e_source_mail_account_get_needs_initial_setup([self SOURCEMAILACCOUNT]);
}

- (void)setArchiveFolder:(OFString*)archiveFolder
{
	e_source_mail_account_set_archive_folder([self SOURCEMAILACCOUNT], [archiveFolder UTF8String]);
}

- (void)setIdentityUid:(OFString*)identityUid
{
	e_source_mail_account_set_identity_uid([self SOURCEMAILACCOUNT], [identityUid UTF8String]);
}

- (void)setMarkSeen:(EThreeState)markSeen
{
	e_source_mail_account_set_mark_seen([self SOURCEMAILACCOUNT], markSeen);
}

- (void)setMarkSeenTimeout:(gint)timeout
{
	e_source_mail_account_set_mark_seen_timeout([self SOURCEMAILACCOUNT], timeout);
}

- (void)setNeedsInitialSetup:(bool)needsInitialSetup
{
	e_source_mail_account_set_needs_initial_setup([self SOURCEMAILACCOUNT], needsInitialSetup);
}


@end