/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGESourceBackend.h"

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGESourceMailAccount : OGESourceBackend
{

}


/**
 * Methods
 */

- (ESourceMailAccount*)castedGObject;

/**
 * Thread-safe variation of e_source_mail_account_get_archive_folder().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceMailAccount:archive-folder
 */
- (OFString*)dupArchiveFolder;

/**
 * Thread-safe variation of e_source_mail_account_get_identity_uid().
 * Use this function when accessing @extension from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #ESourceMailAccount:identity-uid
 */
- (OFString*)dupIdentityUid;

/**
 * Returns a string identifying the archive folder.
 * The format of the identifier string is defined by the client application.
 *
 * @return an identifier of the archive folder
 */
- (OFString*)archiveFolder;

/**
 * Returns whether the mail account is a builtin account. The builtin
 * account cannot be created by a user. The default value is %FALSE.
 *
 * @return %TRUE, when the account is a builtin account
 */
- (bool)builtin;

/**
 * Returns the #ESource:uid of the #ESource that describes the mail
 * identity to be used for this account.
 *
 * @return the mail identity #ESource:uid
 */
- (OFString*)identityUid;

/**
 *
 * @return an #EThreeState, whether messages in this account
 *    should be marked as seen automatically.
 */
- (EThreeState)markSeen;

/**
 *
 * @return timeout in milliseconds for marking messages
 *    as seen in this account
 */
- (gint)markSeenTimeout;

/**
 * Check whether the mail account needs to do its initial setup.
 *
 * @return %TRUE, when the account needs to run its initial setup
 */
- (bool)needsInitialSetup;

/**
 * Sets the folder for sent messages by an identifier string.
 * The format of the identifier string is defined by the client application.
 * 
 * The internal copy of @archive_folder is automatically stripped of leading
 * and trailing whitespace. If the resulting string is empty, %NULL is set
 * instead.
 *
 * @param archiveFolder an identifier for the archive folder, or %NULL
 */
- (void)setArchiveFolder:(OFString*)archiveFolder;

/**
 * Sets whether the account is a builtin account. See e_source_mail_account_get_builtin()
 * for more information about what it means.
 *
 * @param builtin value to set
 */
- (void)setBuiltin:(gint)builtin;

/**
 * Sets the #ESource:uid of the #ESource that describes the mail
 * identity to be used for this account.
 *
 * @param identityUid the mail identity #ESource:uid, or %NULL
 */
- (void)setIdentityUid:(OFString*)identityUid;

/**
 * Sets whether the messages in this account should be marked
 * as seen automatically. An inconsistent state means to use
 * global option.
 *
 * @param markSeen an #EThreeState as the value to set
 */
- (void)setMarkSeen:(EThreeState)markSeen;

/**
 * Sets the @timeout in milliseconds for marking messages
 * as seen in this account. Whether the timeout is used
 * depends on e_source_mail_account_get_mark_seen().
 *
 * @param timeout a timeout in milliseconds
 */
- (void)setMarkSeenTimeout:(gint)timeout;

/**
 * Sets whether the account needs to run its initial setup.
 *
 * @param needsInitialSetup value to set
 */
- (void)setNeedsInitialSetup:(bool)needsInitialSetup;

@end