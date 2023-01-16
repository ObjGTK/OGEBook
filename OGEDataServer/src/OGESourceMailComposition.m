/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceMailComposition.h"

@implementation OGESourceMailComposition

- (ESourceMailComposition*)SOURCEMAILCOMPOSITION
{
	return E_SOURCE_MAIL_COMPOSITION([self GOBJECT]);
}

- (gchar**)dupBcc
{
	return e_source_mail_composition_dup_bcc([self SOURCEMAILCOMPOSITION]);
}

- (gchar**)dupCc
{
	return e_source_mail_composition_dup_cc([self SOURCEMAILCOMPOSITION]);
}

- (OFString*)dupDraftsFolder
{
	return [OFString stringWithUTF8String:e_source_mail_composition_dup_drafts_folder([self SOURCEMAILCOMPOSITION])];
}

- (OFString*)dupLanguage
{
	return [OFString stringWithUTF8String:e_source_mail_composition_dup_language([self SOURCEMAILCOMPOSITION])];
}

- (OFString*)dupTemplatesFolder
{
	return [OFString stringWithUTF8String:e_source_mail_composition_dup_templates_folder([self SOURCEMAILCOMPOSITION])];
}

- (const gchar* const*)bcc
{
	return e_source_mail_composition_get_bcc([self SOURCEMAILCOMPOSITION]);
}

- (const gchar* const*)cc
{
	return e_source_mail_composition_get_cc([self SOURCEMAILCOMPOSITION]);
}

- (OFString*)draftsFolder
{
	return [OFString stringWithUTF8String:e_source_mail_composition_get_drafts_folder([self SOURCEMAILCOMPOSITION])];
}

- (OFString*)language
{
	return [OFString stringWithUTF8String:e_source_mail_composition_get_language([self SOURCEMAILCOMPOSITION])];
}

- (ESourceMailCompositionReplyStyle)replyStyle
{
	return e_source_mail_composition_get_reply_style([self SOURCEMAILCOMPOSITION]);
}

- (bool)signImip
{
	return e_source_mail_composition_get_sign_imip([self SOURCEMAILCOMPOSITION]);
}

- (EThreeState)startBottom
{
	return e_source_mail_composition_get_start_bottom([self SOURCEMAILCOMPOSITION]);
}

- (OFString*)templatesFolder
{
	return [OFString stringWithUTF8String:e_source_mail_composition_get_templates_folder([self SOURCEMAILCOMPOSITION])];
}

- (EThreeState)topSignature
{
	return e_source_mail_composition_get_top_signature([self SOURCEMAILCOMPOSITION]);
}

- (void)setBcc:(const gchar* const*)bcc
{
	e_source_mail_composition_set_bcc([self SOURCEMAILCOMPOSITION], bcc);
}

- (void)setCc:(const gchar* const*)cc
{
	e_source_mail_composition_set_cc([self SOURCEMAILCOMPOSITION], cc);
}

- (void)setDraftsFolder:(OFString*)draftsFolder
{
	e_source_mail_composition_set_drafts_folder([self SOURCEMAILCOMPOSITION], [draftsFolder UTF8String]);
}

- (void)setLanguage:(OFString*)language
{
	e_source_mail_composition_set_language([self SOURCEMAILCOMPOSITION], [language UTF8String]);
}

- (void)setReplyStyle:(ESourceMailCompositionReplyStyle)replyStyle
{
	e_source_mail_composition_set_reply_style([self SOURCEMAILCOMPOSITION], replyStyle);
}

- (void)setSignImip:(bool)signImip
{
	e_source_mail_composition_set_sign_imip([self SOURCEMAILCOMPOSITION], signImip);
}

- (void)setStartBottom:(EThreeState)startBottom
{
	e_source_mail_composition_set_start_bottom([self SOURCEMAILCOMPOSITION], startBottom);
}

- (void)setTemplatesFolder:(OFString*)templatesFolder
{
	e_source_mail_composition_set_templates_folder([self SOURCEMAILCOMPOSITION], [templatesFolder UTF8String]);
}

- (void)setTopSignature:(EThreeState)topSignature
{
	e_source_mail_composition_set_top_signature([self SOURCEMAILCOMPOSITION], topSignature);
}


@end