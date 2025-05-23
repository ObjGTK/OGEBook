/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceMailSubmission.h"

@implementation OGESourceMailSubmission

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_SOURCE_MAIL_SUBMISSION;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (ESourceMailSubmission*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceMailSubmission, ESourceMailSubmission);
}

- (OFString*)dupSentFolder
{
	gchar* gobjectValue = e_source_mail_submission_dup_sent_folder([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupTransportUid
{
	gchar* gobjectValue = e_source_mail_submission_dup_transport_uid([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (bool)repliesToOriginFolder
{
	bool returnValue = (bool)e_source_mail_submission_get_replies_to_origin_folder([self castedGObject]);

	return returnValue;
}

- (OFString*)sentFolder
{
	const gchar* gobjectValue = e_source_mail_submission_get_sent_folder([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)transportUid
{
	const gchar* gobjectValue = e_source_mail_submission_get_transport_uid([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)useSentFolder
{
	bool returnValue = (bool)e_source_mail_submission_get_use_sent_folder([self castedGObject]);

	return returnValue;
}

- (void)setRepliesToOriginFolder:(bool)repliesToOriginFolder
{
	e_source_mail_submission_set_replies_to_origin_folder([self castedGObject], repliesToOriginFolder);
}

- (void)setSentFolder:(OFString*)sentFolder
{
	e_source_mail_submission_set_sent_folder([self castedGObject], [sentFolder UTF8String]);
}

- (void)setTransportUid:(OFString*)transportUid
{
	e_source_mail_submission_set_transport_uid([self castedGObject], [transportUid UTF8String]);
}

- (void)setUseSentFolder:(bool)useSentFolder
{
	e_source_mail_submission_set_use_sent_folder([self castedGObject], useSentFolder);
}


@end