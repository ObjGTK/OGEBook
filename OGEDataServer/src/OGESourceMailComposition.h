/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceExtension.h"

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGESourceMailComposition : OGESourceExtension
{

}


/**
 * Methods
 */

- (ESourceMailComposition*)castedGObject;

/**
 * Thread-safe variation of e_source_mail_composition_get_bcc().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string array should be freed with g_strfreev() when no
 * longer needed.
 *
 * @return a newly-allocated copy of
 * #ESourceMailComposition:bcc
 */
- (gchar**)dupBcc;

/**
 * Thread-safe variation of e_source_mail_composition_get_cc().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string array should be freed with g_strfreev() when no
 * longer needed.
 *
 * @return a newly-allocated copy of
 * #ESourceMailComposition:cc
 */
- (gchar**)dupCc;

/**
 * Thread-safe variation of e_source_mail_composition_get_drafts_folder().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceMailComposition:drafts-folder
 */
- (OFString*)dupDraftsFolder;

/**
 * Thread-safe variation of e_source_mail_composition_get_language().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceMailComposition:language
 */
- (OFString*)dupLanguage;

/**
 * Thread-safe variation of e_source_mail_composition_get_templates_folder().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceMailComposition:templates-folder
 */
- (OFString*)dupTemplatesFolder;

/**
 * Returns a %NULL-terminated string array of recipients which should
 * automatically be added to the blind carbon-copy (Bcc) list when
 * composing a new mail message.  The recipient strings should be of
 * the form "Full Name &lt;email-address&gt;".  The returned array is
 * owned by @extension and should not be modified or freed.
 *
 * @return a %NULL-terminated string array of Bcc recipients
 */
- (const gchar* const*)bcc;

/**
 * Returns a %NULL-terminated string array of recipients which should
 * automatically be added to the carbon-copy (Cc) list when composing a
 * new mail message.  The recipient strings should be of the form "Full
 * Name <email-address>".  The returned array is owned by @extension and
 * should not be modified or freed.
 *
 * @return a %NULL-terminated string array of Cc recipients
 */
- (const gchar* const*)cc;

/**
 * Returns a string identifying the preferred folder for draft messages.
 * The format of the identifier string is defined by the client application.
 *
 * @return an identifier for the preferred drafts folder
 */
- (OFString*)draftsFolder;

/**
 * Returns a string identifying the preferred language, like "en_US".
 *
 * @return an identifier for the preferred language, or %NULL for none
 */
- (OFString*)language;

/**
 * Returns preferred reply style to be used when replying
 * using the associated account. If no preference is set,
 * the %E_SOURCE_MAIL_COMPOSITION_REPLY_STYLE_DEFAULT is returned.
 *
 * @return reply style preference
 */
- (ESourceMailCompositionReplyStyle)replyStyle;

/**
 * Returns whether outgoing iMIP messages such as meeting requests should
 * also be signed.  This is primarily intended as a workaround for certain
 * versions of Microsoft Outlook which can't handle signed iMIP messages.
 *
 * @return whether outgoing iMIP messages should be signed
 */
- (bool)signImip;

/**
 * Returns whether start at bottom when replying or forwarding
 * using the associated account. If no preference is set,
 * the %E_THREE_STATE_INCONSISTENT is returned.
 *
 * @return start bottom on reply or forward preference
 */
- (EThreeState)startBottom;

/**
 * Returns a string identifying the preferred folder for message templates.
 * The format of the identifier string is defined by the client application.
 *
 * @return an identifier for the preferred templates folder
 */
- (OFString*)templatesFolder;

/**
 * Returns whether place signature at top when replying or forwarding
 * using the associated account. If no preference is set,
 * the %E_THREE_STATE_INCONSISTENT is returned.
 *
 * @return top signature on reply or forward preference
 */
- (EThreeState)topSignature;

/**
 * Sets the recipients which should automatically be added to the blind
 * carbon-copy (Bcc) list when composing a new mail message.  The recipient
 * strings should be of the form "Full Name &lt;email-address&gt;".
 *
 * @param bcc a %NULL-terminated string array of Bcc
 *    recipients
 */
- (void)setBcc:(const gchar* const*)bcc;

/**
 * Sets the recipients which should automatically be added to the carbon
 * copy (Cc) list when composing a new mail message.  The recipient strings
 * should be of the form "Full Name &lt;email-address&gt;".
 *
 * @param cc a %NULL-terminated string array of Cc
 *    recipients
 */
- (void)setCc:(const gchar* const*)cc;

/**
 * Sets the preferred folder for draft messages by an identifier string.
 * The format of the identifier string is defined by the client application.
 * 
 * The internal copy of @drafts_folder is automatically stripped of
 * leading and trailing whitespace.  If the resulting string is empty,
 * %NULL is set instead.
 *
 * @param draftsFolder an identifier for the preferred drafts
 *                 folder, or %NULL
 */
- (void)setDraftsFolder:(OFString*)draftsFolder;

/**
 * Sets the preferred language by an identifier string, like "en_US".
 * Use %NULL to unset any previous value.
 * 
 * The internal copy of @language is automatically stripped of
 * leading and trailing whitespace.  If the resulting string is empty,
 * %NULL is set instead.
 *
 * @param language an identifier for the preferred language, or %NULL
 */
- (void)setLanguage:(OFString*)language;

/**
 * Sets preferred reply style to be used when replying
 * using the associated account. To unset the preference,
 * use the %E_SOURCE_MAIL_COMPOSITION_REPLY_STYLE_DEFAULT.
 *
 * @param replyStyle an #ESourceMailCompositionReplyStyle
 */
- (void)setReplyStyle:(ESourceMailCompositionReplyStyle)replyStyle;

/**
 * Sets whether outgoing iMIP messages such as meeting requests should
 * also be signed.  This is primarily intended as a workaround for certain
 * versions of Microsoft Outlook which can't handle signed iMIP messages.
 *
 * @param signImip whether outgoing iMIP messages should be signed
 */
- (void)setSignImip:(bool)signImip;

/**
 * Sets whether start bottom when replying or forwarding using the associated account.
 * To unset the preference, use the %E_THREE_STATE_INCONSISTENT.
 *
 * @param startBottom an #EThreeState
 */
- (void)setStartBottom:(EThreeState)startBottom;

/**
 * Sets the preferred folder for message templates by an identifier string.
 * The format of the identifier string is defined by the client application.
 * 
 * The internal copy of @templates_folder is automatically stripped of
 * leading and trailing whitespace.  If the resulting string is empty,
 * %NULL is set instead.
 *
 * @param templatesFolder an identifier for the preferred templates
 *                    folder, or %NULL
 */
- (void)setTemplatesFolder:(OFString*)templatesFolder;

/**
 * Sets whether place signature at top when replying or forwarding using the associated account.
 * To unset the preference, use the %E_THREE_STATE_INCONSISTENT.
 *
 * @param topSignature an #EThreeState
 */
- (void)setTopSignature:(EThreeState)topSignature;

@end