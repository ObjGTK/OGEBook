/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceMailComposition.h"

@implementation OGESourceMailComposition

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_SOURCE_MAIL_COMPOSITION;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (ESourceMailComposition*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], ESourceMailComposition, ESourceMailComposition);
}

- (gchar**)dupBcc
{
	gchar** returnValue = (gchar**)e_source_mail_composition_dup_bcc([self castedGObject]);

	return returnValue;
}

- (gchar**)dupCc
{
	gchar** returnValue = (gchar**)e_source_mail_composition_dup_cc([self castedGObject]);

	return returnValue;
}

- (OFString*)dupDraftsFolder
{
	gchar* gobjectValue = e_source_mail_composition_dup_drafts_folder([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupLanguage
{
	gchar* gobjectValue = e_source_mail_composition_dup_language([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (OFString*)dupTemplatesFolder
{
	gchar* gobjectValue = e_source_mail_composition_dup_templates_folder([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (const gchar* const*)bcc
{
	const gchar* const* returnValue = (const gchar* const*)e_source_mail_composition_get_bcc([self castedGObject]);

	return returnValue;
}

- (const gchar* const*)cc
{
	const gchar* const* returnValue = (const gchar* const*)e_source_mail_composition_get_cc([self castedGObject]);

	return returnValue;
}

- (OFString*)draftsFolder
{
	const gchar* gobjectValue = e_source_mail_composition_get_drafts_folder([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)language
{
	const gchar* gobjectValue = e_source_mail_composition_get_language([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (ESourceMailCompositionReplyStyle)replyStyle
{
	ESourceMailCompositionReplyStyle returnValue = (ESourceMailCompositionReplyStyle)e_source_mail_composition_get_reply_style([self castedGObject]);

	return returnValue;
}

- (bool)signImip
{
	bool returnValue = (bool)e_source_mail_composition_get_sign_imip([self castedGObject]);

	return returnValue;
}

- (EThreeState)startBottom
{
	EThreeState returnValue = (EThreeState)e_source_mail_composition_get_start_bottom([self castedGObject]);

	return returnValue;
}

- (OFString*)templatesFolder
{
	const gchar* gobjectValue = e_source_mail_composition_get_templates_folder([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (EThreeState)topSignature
{
	EThreeState returnValue = (EThreeState)e_source_mail_composition_get_top_signature([self castedGObject]);

	return returnValue;
}

- (void)setBcc:(const gchar* const*)bcc
{
	e_source_mail_composition_set_bcc([self castedGObject], bcc);
}

- (void)setCc:(const gchar* const*)cc
{
	e_source_mail_composition_set_cc([self castedGObject], cc);
}

- (void)setDraftsFolder:(OFString*)draftsFolder
{
	e_source_mail_composition_set_drafts_folder([self castedGObject], [draftsFolder UTF8String]);
}

- (void)setLanguage:(OFString*)language
{
	e_source_mail_composition_set_language([self castedGObject], [language UTF8String]);
}

- (void)setReplyStyle:(ESourceMailCompositionReplyStyle)replyStyle
{
	e_source_mail_composition_set_reply_style([self castedGObject], replyStyle);
}

- (void)setSignImip:(bool)signImip
{
	e_source_mail_composition_set_sign_imip([self castedGObject], signImip);
}

- (void)setStartBottom:(EThreeState)startBottom
{
	e_source_mail_composition_set_start_bottom([self castedGObject], startBottom);
}

- (void)setTemplatesFolder:(OFString*)templatesFolder
{
	e_source_mail_composition_set_templates_folder([self castedGObject], [templatesFolder UTF8String]);
}

- (void)setTopSignature:(EThreeState)topSignature
{
	e_source_mail_composition_set_top_signature([self castedGObject], topSignature);
}


@end