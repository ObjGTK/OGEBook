/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@interface OGCamelDB : OGObject
{

}

/**
 * Functions
 */

/**
 * Frees the @record and all of its associated data.
 *
 * @param record a #CamelMIRecord
 */
+ (void)camelMirFree:(CamelMIRecord*)record;

/**
 *
 * @return
 */
+ (GQuark)errorQuark;

/**
 * Frees a string previosuly returned by camel_db_sqlize_string().
 *
 * @param string a string to free
 */
+ (void)freeSqlizedString:(OFString*)string;

/**
 * Traverses column name from index @index into an enum
 * #CamelDBKnownColumnNames value.  The @col_names contains @ncols columns.
 * First time this is called is created the @hash from col_names indexes into
 * the enum, and this is reused for every other call.  The function expects
 * that column names are returned always in the same order.  When all rows
 * are read the @hash table can be freed with g_hash_table_destroy().
 *
 * @param hash a #GHashTable
 * @param index an index to start with, between 0 and @ncols
 * @param ncols number of @col_names
 * @param colNames column names to traverse
 * @return
 */
+ (CamelDBKnownColumnNames)columnIdentWithHash:(GHashTable**)hash index:(gint)index ncols:(gint)ncols colNames:(gchar**)colNames;

/**
 *
 * @param rawName raw name to find the column name for
 * @return A corresponding column name in the message info table
 *   for the @raw_name, or %NULL, when there is no corresponding column in the summary.
 */
+ (OFString*)columnName:(OFString*)rawName;

/**
 * Instructs sqlite to release its memory, if possible. This can be avoided
 * when CAMEL_SQLITE_FREE_CACHE environment variable is set.
 *
 */
+ (void)releaseCacheMemory;

/**
 * Converts the @string to be usable in the SQLite statements.
 *
 * @param string a string to "sqlize"
 * @return A newly allocated sqlized @string. The returned
 *    value should be freed with camel_db_sqlize_string(), when no longer needed.
 */
+ (OFString*)sqlizeString:(OFString*)string;

/**
 * Constructors
 */
- (instancetype)init:(OFString*)filename;

/**
 * Methods
 */

- (CamelDB*)castedGObject;

/**
 * Ends an ongoing transaction by ignoring the changes.
 *
 * @return 0 on success, -1 on error
 */
- (gint)abortTransaction;

/**
 * Adds a statement to an ongoing transaction.
 *
 * @param query an SQL (SQLite) statement
 * @return 0 on success, -1 on error
 */
- (gint)addToTransaction:(OFString*)query;

/**
 * Begins transaction. End it with camel_db_end_transaction() or camel_db_abort_transaction().
 *
 * @return 0 on success, -1 on error
 */
- (gint)beginTransaction;

/**
 * Deletes the given folder from the 'folders' table and empties
 * its message info table.
 *
 * @param folderName full name of the folder
 * @return 0 on success, -1 on error
 */
- (gint)clearFolderSummary:(OFString*)folderName;

/**
 * Executes an SQLite command.
 *
 * @param stmt an SQL (SQLite) statement to execute
 * @return 0 on success, -1 on error
 */
- (gint)command:(OFString*)stmt;

/**
 * Counts how many deleted messages is stored in the given table.
 *
 * @param tableName name of the table
 * @param count where to store the resulting count
 * @return 0 on success, -1 on error
 */
- (gint)countDeletedMessageInfoWithTableName:(OFString*)tableName count:(guint32*)count;

/**
 * Counts how many junk messages is stored in the given table.
 *
 * @param tableName name of the table
 * @param count where to store the resulting count
 * @return 0 on success, -1 on error
 */
- (gint)countJunkMessageInfoWithTableName:(OFString*)tableName count:(guint32*)count;

/**
 *
 * @param tableName
 * @param count
 * @return
 */
- (gint)countJunkNotDeletedMessageInfoWithTableName:(OFString*)tableName count:(guint32*)count;

/**
 * Executes a COUNT() query (like "SELECT COUNT(*) FROM table") and provides
 * the result of it as an unsigned 32-bit integer.
 *
 * @param query a COUNT() query
 * @param count the result of the query
 * @return 0 on success, -1 on error
 */
- (gint)countMessageInfoWithQuery:(OFString*)query count:(guint32*)count;

/**
 * Counts how many messages is stored in the given table.
 *
 * @param tableName name of the table
 * @param count where to store the resulting count
 * @return 0 on success, -1 on error
 */
- (gint)countTotalMessageInfoWithTableName:(OFString*)tableName count:(guint32*)count;

/**
 * Counts how many unread messages is stored in the given table.
 *
 * @param tableName name of the table
 * @param count where to store the resulting count
 * @return 0 on success, -1 on error
 */
- (gint)countUnreadMessageInfoWithTableName:(OFString*)tableName count:(guint32*)count;

/**
 * Counts how many visible (not deleted and not junk) messages is stored in the given table.
 *
 * @param tableName name of the table
 * @param count where to store the resulting count
 * @return 0 on success, -1 on error
 */
- (gint)countVisibleMessageInfoWithTableName:(OFString*)tableName count:(guint32*)count;

/**
 * Counts how many visible (not deleted and not junk) and unread messages is stored in the given table.
 *
 * @param tableName name of the table
 * @param count where to store the resulting count
 * @return 0 on success, -1 on error
 */
- (gint)countVisibleUnreadMessageInfoWithTableName:(OFString*)tableName count:(guint32*)count;

/**
 * Creates a 'folders' table, if it doesn't exist yet.
 *
 * @return 0 on success, -1 on error
 */
- (gint)createFoldersTable;

/**
 * Deletes the given folder from the 'folders' table and also drops
 * its message info table.
 *
 * @param folderName full name of the folder
 * @return 0 on success, -1 on error
 */
- (gint)deleteFolder:(OFString*)folderName;

/**
 * Deletes single mesage info in the given folder with
 * the given UID.
 *
 * @param folderName full name of the folder
 * @param uid a message info UID to delete
 * @return 0 on success, -1 on error
 */
- (gint)deleteUidWithFolderName:(OFString*)folderName uid:(OFString*)uid;

/**
 * Deletes a list of message UIDs as one transaction.
 *
 * @param folderName full name of the folder
 * @param uids A #GList of uids
 * @return 0 on success, -1 on error
 */
- (gint)deleteUidsWithFolderName:(OFString*)folderName uids:(const GList*)uids;

/**
 * Ends an ongoing transaction by committing the changes.
 *
 * @return 0 on success, -1 on error
 */
- (gint)endTransaction;

/**
 * A pair function for camel_db_start_in_memory_transactions(),
 * to commit the changes to @folder_name and free the in-memory table.
 *
 * @param folderName full name of the folder
 * @return 0 on success, -1 on error
 */
- (gint)flushInMemoryTransactions:(OFString*)folderName;

/**
 *
 * @return A filename associated with @cdb.
 */
- (OFString*)filename;

/**
 *
 * @param folderName full name of the folder
 * @return An array
 *   of the UID-s of the deleted messages in the given folder. Use
 *   camel_pstring_free() to free the elements.
 */
- (GPtrArray*)folderDeletedUids:(OFString*)folderName;

/**
 *
 * @param folderName full name of the folder
 * @return An array
 *   of the UID-s of the junk messages in the given folder. Use
 *   camel_pstring_free() to free the elements.
 */
- (GPtrArray*)folderJunkUids:(OFString*)folderName;

/**
 * Fills hash with uid->GUINT_TO_POINTER (flag). Use camel_pstring_free()
 * to free the keys of the @hash.
 *
 * @param folderName full name of the folder
 * @param sortBy optional ORDER BY clause (without the "ORDER BY" prefix)
 * @param collate optional collate function name to use
 * @param hash a hash table to fill
 * @return 0 on success, -1 on error
 */
- (gint)folderUidsWithFolderName:(OFString*)folderName sortBy:(OFString*)sortBy collate:(OFString*)collate hash:(GHashTable*)hash;

/**
 * Runs a @cdb maintenance, which includes vacuum, if necessary.
 *
 * @return Whether succeeded.
 */
- (bool)maybeRunMaintenance;

/**
 * Prepares message info table for the given folder.
 *
 * @param folderName full name of the folder
 * @return 0 on success, -1 on error
 */
- (gint)prepareMessageInfoTable:(OFString*)folderName;

/**
 * reads folder information for the given folder and stores it into the @record.
 *
 * @param folderName full name of the folder
 * @param record a #CamelFIRecord
 * @return 0 on success, -1 on error
 */
- (gint)readFolderInfoRecordWithFolderName:(OFString*)folderName record:(CamelFIRecord*)record;

/**
 * Selects single message info for the given @uid in folder @folder_name and calls
 * the @callback for it.
 *
 * @param folderName full name of the folder
 * @param uid a message info UID to read the record for
 * @param userData user data of the @callback
 * @param callback callback to call for the found row
 * @return 0 on success, -1 on error
 */
- (gint)readMessageInfoRecordWithUidWithFolderName:(OFString*)folderName uid:(OFString*)uid userData:(gpointer)userData callback:(CamelDBSelectCB)callback;

/**
 * Reads all mesasge info records for the given folder and calls @callback for them.
 *
 * @param folderName full name of the folder
 * @param userData user data for the @callback
 * @param callback callback to call for each found row
 * @return 0 on success, -1 on error
 */
- (gint)readMessageInfoRecordsWithFolderName:(OFString*)folderName userData:(gpointer)userData callback:(CamelDBSelectCB)callback;

/**
 * Renames tables for the @old_folder_name to be used with @new_folder_name.
 *
 * @param oldFolderName full name of the existing folder
 * @param newFolderName full name of the folder to rename it to
 * @return 0 on success, -1 on error
 */
- (gint)renameFolderWithOldFolderName:(OFString*)oldFolderName newFolderName:(OFString*)newFolderName;

/**
 * Sets a version number for the given folder.
 *
 * @param folderName full name of the folder
 * @param resetVersion version number to set
 * @return 0 on success, -1 on error
 */
- (gint)resetFolderVersionWithFolderName:(OFString*)folderName resetVersion:(gint)resetVersion;

/**
 * Executes a SELECT staement and calls the @callback for each selected row.
 *
 * @param stmt a SELECT statment to execute
 * @param callback a callback to call for each row
 * @param userData user data for the @callback
 * @return 0 on success, -1 on error
 */
- (gint)selectWithStmt:(OFString*)stmt callback:(CamelDBSelectCB)callback userData:(gpointer)userData;

/**
 * Defines a collation @collate, which can be used in SQL (SQLite)
 * statement as a collation function. The @func is called when
 * colation is used.
 *
 * @param col a column name; currently unused
 * @param collate collation name
 * @param func a #CamelDBCollate collation function
 * @return
 */
- (gint)setCollateWithCol:(OFString*)col collate:(OFString*)collate func:(CamelDBCollate)func;

/**
 * Creates an in-memory table for a batch transactions. Use camel_db_flush_in_memory_transactions()
 * to commit the changes and free the in-memory table.
 *
 * @return 0 on success, -1 on error
 */
- (gint)startInMemoryTransactions;

/**
 * Runs the list of commands as a single transaction.
 *
 * @param qryList A #GList of querries
 * @return 0 on success, -1 on error
 */
- (gint)transactionCommand:(const GList*)qryList;

/**
 * Write the @record to the 'folders' table.
 *
 * @param record a #CamelFIRecord
 * @return 0 on success, -1 on error
 */
- (gint)writeFolderInfoRecord:(CamelFIRecord*)record;

/**
 * Write the @record to the message info table of the given folder.
 *
 * @param folderName full name of the folder
 * @param record a #CamelMIRecord
 * @return 0 on success, -1 on error
 */
- (gint)writeMessageInfoRecordWithFolderName:(OFString*)folderName record:(CamelMIRecord*)record;

@end