/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceMailSubmission.h"

@implementation OGESourceMailSubmission

- (ESourceMailSubmission*)SOURCEMAILSUBMISSION
{
	return E_SOURCE_MAIL_SUBMISSION([self GOBJECT]);
}

- (OFString*)dupSentFolder
{
	return [OFString stringWithUTF8String:e_source_mail_submission_dup_sent_folder([self SOURCEMAILSUBMISSION])];
}

- (OFString*)dupTransportUid
{
	return [OFString stringWithUTF8String:e_source_mail_submission_dup_transport_uid([self SOURCEMAILSUBMISSION])];
}

- (bool)repliesToOriginFolder
{
	return e_source_mail_submission_get_replies_to_origin_folder([self SOURCEMAILSUBMISSION]);
}

- (OFString*)sentFolder
{
	return [OFString stringWithUTF8String:e_source_mail_submission_get_sent_folder([self SOURCEMAILSUBMISSION])];
}

- (OFString*)transportUid
{
	return [OFString stringWithUTF8String:e_source_mail_submission_get_transport_uid([self SOURCEMAILSUBMISSION])];
}

- (bool)useSentFolder
{
	return e_source_mail_submission_get_use_sent_folder([self SOURCEMAILSUBMISSION]);
}

- (void)setRepliesToOriginFolder:(bool)repliesToOriginFolder
{
	e_source_mail_submission_set_replies_to_origin_folder([self SOURCEMAILSUBMISSION], repliesToOriginFolder);
}

- (void)setSentFolder:(OFString*)sentFolder
{
	e_source_mail_submission_set_sent_folder([self SOURCEMAILSUBMISSION], [sentFolder UTF8String]);
}

- (void)setTransportUid:(OFString*)transportUid
{
	e_source_mail_submission_set_transport_uid([self SOURCEMAILSUBMISSION], [transportUid UTF8String]);
}

- (void)setUseSentFolder:(bool)useSentFolder
{
	e_source_mail_submission_set_use_sent_folder([self SOURCEMAILSUBMISSION], useSentFolder);
}


@end