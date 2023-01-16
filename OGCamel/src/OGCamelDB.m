/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelDB.h"

@implementation OGCamelDB

+ (void)camelMirFree:(CamelMIRecord*)record
{
	camel_db_camel_mir_free(record);
}

+ (void)freeSqlizedString:(OFString*)string
{
	camel_db_free_sqlized_string((gchar*) [string UTF8String]);
}

+ (CamelDBKnownColumnNames)columnIdentWithHash:(GHashTable**)hash index:(gint)index ncols:(gint)ncols colNames:(gchar**)colNames
{
	return camel_db_get_column_ident(hash, index, ncols, colNames);
}

+ (OFString*)columnName:(OFString*)rawName
{
	return [OFString stringWithUTF8String:camel_db_get_column_name([rawName UTF8String])];
}

+ (void)releaseCacheMemory
{
	camel_db_release_cache_memory();
}

+ (OFString*)sqlizeString:(OFString*)string
{
	return [OFString stringWithUTF8String:camel_db_sqlize_string([string UTF8String])];
}

- (instancetype)initWithFilename:(OFString*)filename err:(GError**)err
{
	self = [super initWithGObject:(GObject*)camel_db_new([filename UTF8String], err)];

	return self;
}

- (CamelDB*)DB
{
	return CAMEL_DB([self GOBJECT]);
}

- (gint)abortTransaction:(GError**)err
{
	return camel_db_abort_transaction([self DB], err);
}

- (gint)addToTransactionWithQuery:(OFString*)query err:(GError**)err
{
	return camel_db_add_to_transaction([self DB], [query UTF8String], err);
}

- (gint)beginTransaction:(GError**)err
{
	return camel_db_begin_transaction([self DB], err);
}

- (gint)clearFolderSummaryWithFolderName:(OFString*)folderName err:(GError**)err
{
	return camel_db_clear_folder_summary([self DB], [folderName UTF8String], err);
}

- (gint)commandWithStmt:(OFString*)stmt err:(GError**)err
{
	return camel_db_command([self DB], [stmt UTF8String], err);
}

- (gint)countDeletedMessageInfoWithTableName:(OFString*)tableName count:(guint32*)count err:(GError**)err
{
	return camel_db_count_deleted_message_info([self DB], [tableName UTF8String], count, err);
}

- (gint)countJunkMessageInfoWithTableName:(OFString*)tableName count:(guint32*)count err:(GError**)err
{
	return camel_db_count_junk_message_info([self DB], [tableName UTF8String], count, err);
}

- (gint)countJunkNotDeletedMessageInfoWithTableName:(OFString*)tableName count:(guint32*)count err:(GError**)err
{
	return camel_db_count_junk_not_deleted_message_info([self DB], [tableName UTF8String], count, err);
}

- (gint)countMessageInfoWithQuery:(OFString*)query count:(guint32*)count err:(GError**)err
{
	return camel_db_count_message_info([self DB], [query UTF8String], count, err);
}

- (gint)countTotalMessageInfoWithTableName:(OFString*)tableName count:(guint32*)count err:(GError**)err
{
	return camel_db_count_total_message_info([self DB], [tableName UTF8String], count, err);
}

- (gint)countUnreadMessageInfoWithTableName:(OFString*)tableName count:(guint32*)count err:(GError**)err
{
	return camel_db_count_unread_message_info([self DB], [tableName UTF8String], count, err);
}

- (gint)countVisibleMessageInfoWithTableName:(OFString*)tableName count:(guint32*)count err:(GError**)err
{
	return camel_db_count_visible_message_info([self DB], [tableName UTF8String], count, err);
}

- (gint)countVisibleUnreadMessageInfoWithTableName:(OFString*)tableName count:(guint32*)count err:(GError**)err
{
	return camel_db_count_visible_unread_message_info([self DB], [tableName UTF8String], count, err);
}

- (gint)createFoldersTable:(GError**)err
{
	return camel_db_create_folders_table([self DB], err);
}

- (gint)deleteFolderWithFolderName:(OFString*)folderName err:(GError**)err
{
	return camel_db_delete_folder([self DB], [folderName UTF8String], err);
}

- (gint)deleteUidWithFolderName:(OFString*)folderName uid:(OFString*)uid err:(GError**)err
{
	return camel_db_delete_uid([self DB], [folderName UTF8String], [uid UTF8String], err);
}

- (gint)deleteUidsWithFolderName:(OFString*)folderName uids:(const GList*)uids err:(GError**)err
{
	return camel_db_delete_uids([self DB], [folderName UTF8String], uids, err);
}

- (gint)endTransaction:(GError**)err
{
	return camel_db_end_transaction([self DB], err);
}

- (gint)flushInMemoryTransactionsWithFolderName:(OFString*)folderName err:(GError**)err
{
	return camel_db_flush_in_memory_transactions([self DB], [folderName UTF8String], err);
}

- (OFString*)filename
{
	return [OFString stringWithUTF8String:camel_db_get_filename([self DB])];
}

- (GPtrArray*)folderDeletedUidsWithFolderName:(OFString*)folderName err:(GError**)err
{
	return camel_db_get_folder_deleted_uids([self DB], [folderName UTF8String], err);
}

- (GPtrArray*)folderJunkUidsWithFolderName:(OFString*)folderName err:(GError**)err
{
	return camel_db_get_folder_junk_uids([self DB], [folderName UTF8String], err);
}

- (gint)folderUidsWithFolderName:(OFString*)folderName sortBy:(OFString*)sortBy collate:(OFString*)collate hash:(GHashTable*)hash err:(GError**)err
{
	return camel_db_get_folder_uids([self DB], [folderName UTF8String], [sortBy UTF8String], [collate UTF8String], hash, err);
}

- (bool)maybeRunMaintenance:(GError**)err
{
	return camel_db_maybe_run_maintenance([self DB], err);
}

- (gint)prepareMessageInfoTableWithFolderName:(OFString*)folderName err:(GError**)err
{
	return camel_db_prepare_message_info_table([self DB], [folderName UTF8String], err);
}

- (gint)readFolderInfoRecordWithFolderName:(OFString*)folderName record:(CamelFIRecord*)record err:(GError**)err
{
	return camel_db_read_folder_info_record([self DB], [folderName UTF8String], record, err);
}

- (gint)readMessageInfoRecordWithUidWithFolderName:(OFString*)folderName uid:(OFString*)uid userData:(gpointer)userData callback:(CamelDBSelectCB)callback err:(GError**)err
{
	return camel_db_read_message_info_record_with_uid([self DB], [folderName UTF8String], [uid UTF8String], userData, callback, err);
}

- (gint)readMessageInfoRecordsWithFolderName:(OFString*)folderName userData:(gpointer)userData callback:(CamelDBSelectCB)callback err:(GError**)err
{
	return camel_db_read_message_info_records([self DB], [folderName UTF8String], userData, callback, err);
}

- (gint)renameFolderWithOldFolderName:(OFString*)oldFolderName newFolderName:(OFString*)newFolderName err:(GError**)err
{
	return camel_db_rename_folder([self DB], [oldFolderName UTF8String], [newFolderName UTF8String], err);
}

- (gint)resetFolderVersionWithFolderName:(OFString*)folderName resetVersion:(gint)resetVersion err:(GError**)err
{
	return camel_db_reset_folder_version([self DB], [folderName UTF8String], resetVersion, err);
}

- (gint)selectWithStmt:(OFString*)stmt callback:(CamelDBSelectCB)callback userData:(gpointer)userData err:(GError**)err
{
	return camel_db_select([self DB], [stmt UTF8String], callback, userData, err);
}

- (gint)setCollateWithCol:(OFString*)col collate:(OFString*)collate func:(CamelDBCollate)func
{
	return camel_db_set_collate([self DB], [col UTF8String], [collate UTF8String], func);
}

- (gint)startInMemoryTransactions:(GError**)err
{
	return camel_db_start_in_memory_transactions([self DB], err);
}

- (gint)transactionCommandWithQryList:(const GList*)qryList err:(GError**)err
{
	return camel_db_transaction_command([self DB], qryList, err);
}

- (gint)writeFolderInfoRecordWithRecord:(CamelFIRecord*)record err:(GError**)err
{
	return camel_db_write_folder_info_record([self DB], record, err);
}

- (gint)writeMessageInfoRecordWithFolderName:(OFString*)folderName record:(CamelMIRecord*)record err:(GError**)err
{
	return camel_db_write_message_info_record([self DB], [folderName UTF8String], record, err);
}


@end