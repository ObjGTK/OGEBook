/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceExtension.h"

/**
 * Contains only private data that should be read and manipulated using the
 * function below.
 *
 */
@interface OGESourceMailSubmission : OGESourceExtension
{

}


/**
 * Methods
 */

- (ESourceMailSubmission*)castedGObject;

/**
 * Thread-safe variation of e_source_mail_submission_get_sent_folder().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceMailSubmission:sent-folder
 */
- (OFString*)dupSentFolder;

/**
 * Thread-safe variation of e_source_mail_submission_get_transport_uid().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceMailSubmission:transport-uid
 */
- (OFString*)dupTransportUid;

/**
 * Returns whether save replies in the folder of the message
 * being replied to, instead of the Sent folder.
 *
 * @return whether save replies in the folder of the message being replied to
 */
- (bool)repliesToOriginFolder;

/**
 * Returns a string identifying the preferred folder for sent messages.
 * The format of the identifier string is defined by the client application.
 *
 * @return an identifier for the preferred sent folder
 */
- (OFString*)sentFolder;

/**
 * Returns the #ESource:uid of the #ESource that describes the mail
 * transport to be used for outgoing messages.
 *
 * @return the mail transport #ESource:uid
 */
- (OFString*)transportUid;

/**
 *
 * @return whether save messages to the sent folder at all
 */
- (bool)useSentFolder;

/**
 * Sets whether save replies in the folder of the message
 * being replied to, instead of the Sent folder.
 *
 * @param repliesToOriginFolder new value
 */
- (void)setRepliesToOriginFolder:(bool)repliesToOriginFolder;

/**
 * Sets the preferred folder for sent messages by an identifier string.
 * The format of the identifier string is defined by the client application.
 * 
 * The internal copy of @sent_folder is automatically stripped of leading
 * and trailing whitespace.  If the resulting string is empty, %NULL is set
 * instead.
 *
 * @param sentFolder an identifier for the preferred sent folder,
 *               or %NULL
 */
- (void)setSentFolder:(OFString*)sentFolder;

/**
 * Sets the #ESource:uid of the #ESource that describes the mail
 * transport to be used for outgoing messages.
 *
 * @param transportUid the mail transport #ESource:uid, or %NULL
 */
- (void)setTransportUid:(OFString*)transportUid;

/**
 * Sets whether save messages to the sent folder at all.
 *
 * @param useSentFolder the value to set
 */
- (void)setUseSentFolder:(bool)useSentFolder;

@end