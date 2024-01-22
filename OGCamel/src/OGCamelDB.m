/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelDB.h"

@implementation OGCamelDB

+ (void)camelMirFree:(CamelMIRecord*)record
{
	camel_db_camel_mir_free(record);
}

+ (GQuark)errorQuark
{
	GQuark returnValue = camel_db_error_quark();

	return returnValue;
}

+ (void)freeSqlizedString:(OFString*)string
{
	camel_db_free_sqlized_string(g_strdup([string UTF8String]));
}

+ (CamelDBKnownColumnNames)columnIdentWithHash:(GHashTable**)hash index:(gint)index ncols:(gint)ncols colNames:(gchar**)colNames
{
	CamelDBKnownColumnNames returnValue = camel_db_get_column_ident(hash, index, ncols, colNames);

	return returnValue;
}

+ (OFString*)columnName:(OFString*)rawName
{
	gchar* gobjectValue = camel_db_get_column_name([rawName UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

+ (void)releaseCacheMemory
{
	camel_db_release_cache_memory();
}

+ (OFString*)sqlizeString:(OFString*)string
{
	gchar* gobjectValue = camel_db_sqlize_string([string UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (instancetype)init:(OFString*)filename
{
	GError* err = NULL;

	CamelDB* gobjectValue = CAMEL_DB(camel_db_new([filename UTF8String], &err));

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		if(gobjectValue != NULL)
			g_object_unref(gobjectValue);
		@throw exception;
	}

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (CamelDB*)castedGObject
{
	return CAMEL_DB([self gObject]);
}

- (gint)abortTransaction
{
	GError* err = NULL;

	gint returnValue = camel_db_abort_transaction([self castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)addToTransaction:(OFString*)query
{
	GError* err = NULL;

	gint returnValue = camel_db_add_to_transaction([self castedGObject], [query UTF8String], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)beginTransaction
{
	GError* err = NULL;

	gint returnValue = camel_db_begin_transaction([self castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)clearFolderSummary:(OFString*)folderName
{
	GError* err = NULL;

	gint returnValue = camel_db_clear_folder_summary([self castedGObject], [folderName UTF8String], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)command:(OFString*)stmt
{
	GError* err = NULL;

	gint returnValue = camel_db_command([self castedGObject], [stmt UTF8String], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)countDeletedMessageInfoWithTableName:(OFString*)tableName count:(guint32*)count
{
	GError* err = NULL;

	gint returnValue = camel_db_count_deleted_message_info([self castedGObject], [tableName UTF8String], count, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)countJunkMessageInfoWithTableName:(OFString*)tableName count:(guint32*)count
{
	GError* err = NULL;

	gint returnValue = camel_db_count_junk_message_info([self castedGObject], [tableName UTF8String], count, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)countJunkNotDeletedMessageInfoWithTableName:(OFString*)tableName count:(guint32*)count
{
	GError* err = NULL;

	gint returnValue = camel_db_count_junk_not_deleted_message_info([self castedGObject], [tableName UTF8String], count, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)countMessageInfoWithQuery:(OFString*)query count:(guint32*)count
{
	GError* err = NULL;

	gint returnValue = camel_db_count_message_info([self castedGObject], [query UTF8String], count, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)countTotalMessageInfoWithTableName:(OFString*)tableName count:(guint32*)count
{
	GError* err = NULL;

	gint returnValue = camel_db_count_total_message_info([self castedGObject], [tableName UTF8String], count, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)countUnreadMessageInfoWithTableName:(OFString*)tableName count:(guint32*)count
{
	GError* err = NULL;

	gint returnValue = camel_db_count_unread_message_info([self castedGObject], [tableName UTF8String], count, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)countVisibleMessageInfoWithTableName:(OFString*)tableName count:(guint32*)count
{
	GError* err = NULL;

	gint returnValue = camel_db_count_visible_message_info([self castedGObject], [tableName UTF8String], count, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)countVisibleUnreadMessageInfoWithTableName:(OFString*)tableName count:(guint32*)count
{
	GError* err = NULL;

	gint returnValue = camel_db_count_visible_unread_message_info([self castedGObject], [tableName UTF8String], count, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)createFoldersTable
{
	GError* err = NULL;

	gint returnValue = camel_db_create_folders_table([self castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)deleteFolder:(OFString*)folderName
{
	GError* err = NULL;

	gint returnValue = camel_db_delete_folder([self castedGObject], [folderName UTF8String], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)deleteUidWithFolderName:(OFString*)folderName uid:(OFString*)uid
{
	GError* err = NULL;

	gint returnValue = camel_db_delete_uid([self castedGObject], [folderName UTF8String], [uid UTF8String], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)deleteUidsWithFolderName:(OFString*)folderName uids:(const GList*)uids
{
	GError* err = NULL;

	gint returnValue = camel_db_delete_uids([self castedGObject], [folderName UTF8String], uids, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)endTransaction
{
	GError* err = NULL;

	gint returnValue = camel_db_end_transaction([self castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)flushInMemoryTransactions:(OFString*)folderName
{
	GError* err = NULL;

	gint returnValue = camel_db_flush_in_memory_transactions([self castedGObject], [folderName UTF8String], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (OFString*)filename
{
	const gchar* gobjectValue = camel_db_get_filename([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GPtrArray*)folderDeletedUids:(OFString*)folderName
{
	GError* err = NULL;

	GPtrArray* returnValue = camel_db_get_folder_deleted_uids([self castedGObject], [folderName UTF8String], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (GPtrArray*)folderJunkUids:(OFString*)folderName
{
	GError* err = NULL;

	GPtrArray* returnValue = camel_db_get_folder_junk_uids([self castedGObject], [folderName UTF8String], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)folderUidsWithFolderName:(OFString*)folderName sortBy:(OFString*)sortBy collate:(OFString*)collate hash:(GHashTable*)hash
{
	GError* err = NULL;

	gint returnValue = camel_db_get_folder_uids([self castedGObject], [folderName UTF8String], [sortBy UTF8String], [collate UTF8String], hash, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)maybeRunMaintenance
{
	GError* err = NULL;

	bool returnValue = camel_db_maybe_run_maintenance([self castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)prepareMessageInfoTable:(OFString*)folderName
{
	GError* err = NULL;

	gint returnValue = camel_db_prepare_message_info_table([self castedGObject], [folderName UTF8String], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)readFolderInfoRecordWithFolderName:(OFString*)folderName record:(CamelFIRecord*)record
{
	GError* err = NULL;

	gint returnValue = camel_db_read_folder_info_record([self castedGObject], [folderName UTF8String], record, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)readMessageInfoRecordWithUidWithFolderName:(OFString*)folderName uid:(OFString*)uid userData:(gpointer)userData callback:(CamelDBSelectCB)callback
{
	GError* err = NULL;

	gint returnValue = camel_db_read_message_info_record_with_uid([self castedGObject], [folderName UTF8String], [uid UTF8String], userData, callback, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)readMessageInfoRecordsWithFolderName:(OFString*)folderName userData:(gpointer)userData callback:(CamelDBSelectCB)callback
{
	GError* err = NULL;

	gint returnValue = camel_db_read_message_info_records([self castedGObject], [folderName UTF8String], userData, callback, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)renameFolderWithOldFolderName:(OFString*)oldFolderName newFolderName:(OFString*)newFolderName
{
	GError* err = NULL;

	gint returnValue = camel_db_rename_folder([self castedGObject], [oldFolderName UTF8String], [newFolderName UTF8String], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)resetFolderVersionWithFolderName:(OFString*)folderName resetVersion:(gint)resetVersion
{
	GError* err = NULL;

	gint returnValue = camel_db_reset_folder_version([self castedGObject], [folderName UTF8String], resetVersion, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)selectWithStmt:(OFString*)stmt callback:(CamelDBSelectCB)callback userData:(gpointer)userData
{
	GError* err = NULL;

	gint returnValue = camel_db_select([self castedGObject], [stmt UTF8String], callback, userData, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)setCollateWithCol:(OFString*)col collate:(OFString*)collate func:(CamelDBCollate)func
{
	gint returnValue = camel_db_set_collate([self castedGObject], [col UTF8String], [collate UTF8String], func);

	return returnValue;
}

- (gint)startInMemoryTransactions
{
	GError* err = NULL;

	gint returnValue = camel_db_start_in_memory_transactions([self castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)transactionCommand:(const GList*)qryList
{
	GError* err = NULL;

	gint returnValue = camel_db_transaction_command([self castedGObject], qryList, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)writeFolderInfoRecord:(CamelFIRecord*)record
{
	GError* err = NULL;

	gint returnValue = camel_db_write_folder_info_record([self castedGObject], record, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)writeMessageInfoRecordWithFolderName:(OFString*)folderName record:(CamelMIRecord*)record
{
	GError* err = NULL;

	gint returnValue = camel_db_write_message_info_record([self castedGObject], [folderName UTF8String], record, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}


@end