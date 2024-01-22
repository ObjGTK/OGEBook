/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@class OGCamelMimeMessage;
@class OGCamelSession;
@class OGCancellable;
@class OGCamelFolder;
@class OGCamelMessageInfo;

@interface OGCamelFilterDriver : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init:(OGCamelSession*)session;

/**
 * Methods
 */

- (CamelFilterDriver*)castedGObject;

/**
 * Adds a new rule to set of rules to process by the filter driver.
 *
 * @param name name of the rule
 * @param match a code (#CamelSExp) to execute to check whether the rule can be applied
 * @param action an action code (#CamelSExp) to execute, when the @match evaluates to %TRUE
 */
- (void)addRuleWithName:(OFString*)name match:(OFString*)match action:(OFString*)action;

/**
 * Filters a folder based on rules defined in the FilterDriver
 * object.
 *
 * @param folder CamelFolder to be filtered
 * @param cache UID cache (needed for POP folders)
 * @param uids message uids to be filtered or
 *         %NULL (as a shortcut to filter all messages)
 * @param remove TRUE to mark filtered messages as deleted
 * @param cancellable optional #GCancellable object, or %NULL
 * @return -1 if errors were encountered during filtering,
 * otherwise returns 0.
 */
- (gint)filterFolderWithFolder:(OGCamelFolder*)folder cache:(CamelUIDCache*)cache uids:(GPtrArray*)uids remove:(bool)remove cancellable:(OGCancellable*)cancellable;

/**
 * Filters an mbox file based on rules defined in the FilterDriver
 * object. Is more efficient as it doesn't need to open the folder
 * through Camel directly.
 *
 * @param mbox mbox filename to be filtered
 * @param originalSourceUrl URI of the @mbox, or %NULL
 * @param cancellable optional #GCancellable object, or %NULL
 * @return -1 if errors were encountered during filtering,
 * otherwise returns 0.
 */
- (gint)filterMboxWithMbox:(OFString*)mbox originalSourceUrl:(OFString*)originalSourceUrl cancellable:(OGCancellable*)cancellable;

/**
 * Filters a message based on rules defined in the FilterDriver
 * object. If the source folder (@source) and the uid (@uid) are
 * provided, the filter will operate on the CamelFolder (which in
 * certain cases is more efficient than using the default
 * camel_folder_append_message() function).
 *
 * @param message message to filter or %NULL
 * @param info message info or %NULL
 * @param uid message uid or %NULL
 * @param source source folder or %NULL
 * @param storeUid UID of source store, or %NULL
 * @param originalStoreUid UID of source store (pre-movemail), or %NULL
 * @param cancellable optional #GCancellable object, or %NULL
 * @return -1 if errors were encountered during filtering,
 * otherwise returns 0.
 */
- (gint)filterMessageWithMessage:(OGCamelMimeMessage*)message info:(OGCamelMessageInfo*)info uid:(OFString*)uid source:(OGCamelFolder*)source storeUid:(OFString*)storeUid originalStoreUid:(OFString*)originalStoreUid cancellable:(OGCancellable*)cancellable;

/**
 * Flush all of the only-once filter actions.
 *
 */
- (void)flush;

/**
 * Removes a rule by name, added by camel_filter_driver_add_rule().
 *
 * @param name rule name
 * @return Whether the rule had been found and removed.
 */
- (bool)removeRuleByName:(OFString*)name;

/**
 * Sets a default folder for the driver. The function adds
 * its own reference for the folder.
 *
 * @param def a default #CamelFolder
 */
- (void)setDefaultFolder:(OGCamelFolder*)def;

/**
 * Sets a callback (of type #CamelFilterGetFolderFunc) to get a folder.
 *
 * @param getFolder a callback to get a folder
 * @param userData user data to pass to @get_folder
 */
- (void)setFolderFuncWithGetFolder:(CamelFilterGetFolderFunc)getFolder userData:(gpointer)userData;

/**
 * Sets a log file to use for logging.
 *
 * @param logfile a FILE handle where to write logging
 */
- (void)setLogfile:(FILE*)logfile;

/**
 * Sets a callback to call when a play of a sound is requested.
 *
 * @param func a callback to play a sound
 * @param userData user data to pass to @func
 */
- (void)setPlaySoundFuncWithFunc:(CamelFilterPlaySoundFunc)func userData:(gpointer)userData;

/**
 * Sets a shell command callback, which is called when a shell command
 * execution is requested.
 *
 * @param func a shell command callback
 * @param userData user data to pass to @func
 */
- (void)setShellFuncWithFunc:(CamelFilterShellFunc)func userData:(gpointer)userData;

/**
 * Sets a status callback, which is used to report progress/status.
 *
 * @param func a callback to report progress
 * @param userData user data to pass to @func
 */
- (void)setStatusFuncWithFunc:(CamelFilterStatusFunc)func userData:(gpointer)userData;

/**
 * Sets a callback to use for system beep.
 *
 * @param func a system beep callback
 * @param userData user data to pass to @func
 */
- (void)setSystemBeepFuncWithFunc:(CamelFilterSystemBeepFunc)func userData:(gpointer)userData;

@end