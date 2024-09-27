/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEGDataSession.h"

#import "OGESource.h"
#import <OGJson/OGJsonBuilder.h>
#import <OGio/OGCancellable.h>

@implementation OGEGDataSession

- (instancetype)init:(OGESource*)source
{
	EGDataSession* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(e_gdata_session_new([source castedGObject]), EGDataSession, EGDataSession);

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

- (EGDataSession*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], EGDataSession, EGDataSession);
}

- (bool)tasklistsDeleteSyncWithTasklistId:(OFString*)tasklistId cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_gdata_session_tasklists_delete_sync([self castedGObject], [tasklistId UTF8String], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)tasklistsGetSyncWithTasklistId:(OFString*)tasklistId outTasklist:(JsonObject**)outTasklist cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_gdata_session_tasklists_get_sync([self castedGObject], [tasklistId UTF8String], outTasklist, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)tasklistsInsertSyncWithTitle:(OFString*)title outInsertedTasklist:(JsonObject**)outInsertedTasklist cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_gdata_session_tasklists_insert_sync([self castedGObject], [title UTF8String], outInsertedTasklist, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)tasklistsListSyncWithQuery:(EGDataQuery*)query cb:(EGDataObjectCallback)cb userData:(gpointer)userData cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_gdata_session_tasklists_list_sync([self castedGObject], query, cb, userData, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)tasklistsPatchSyncWithTasklistId:(OFString*)tasklistId tasklistProperties:(OGJsonBuilder*)tasklistProperties outPatchedTasklist:(JsonObject**)outPatchedTasklist cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_gdata_session_tasklists_patch_sync([self castedGObject], [tasklistId UTF8String], [tasklistProperties castedGObject], outPatchedTasklist, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)tasklistsUpdateSyncWithTasklistId:(OFString*)tasklistId tasklist:(OGJsonBuilder*)tasklist outUpdatedTasklist:(JsonObject**)outUpdatedTasklist cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_gdata_session_tasklists_update_sync([self castedGObject], [tasklistId UTF8String], [tasklist castedGObject], outUpdatedTasklist, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)tasksClearSyncWithTasklistId:(OFString*)tasklistId cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_gdata_session_tasks_clear_sync([self castedGObject], [tasklistId UTF8String], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)tasksDeleteSyncWithTasklistId:(OFString*)tasklistId taskId:(OFString*)taskId cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_gdata_session_tasks_delete_sync([self castedGObject], [tasklistId UTF8String], [taskId UTF8String], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)tasksGetSyncWithTasklistId:(OFString*)tasklistId taskId:(OFString*)taskId outTask:(JsonObject**)outTask cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_gdata_session_tasks_get_sync([self castedGObject], [tasklistId UTF8String], [taskId UTF8String], outTask, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)tasksInsertSyncWithTasklistId:(OFString*)tasklistId task:(OGJsonBuilder*)task parentTaskId:(OFString*)parentTaskId previousTaskId:(OFString*)previousTaskId outInsertedTask:(JsonObject**)outInsertedTask cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_gdata_session_tasks_insert_sync([self castedGObject], [tasklistId UTF8String], [task castedGObject], [parentTaskId UTF8String], [previousTaskId UTF8String], outInsertedTask, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)tasksListSyncWithTasklistId:(OFString*)tasklistId query:(EGDataQuery*)query cb:(EGDataObjectCallback)cb userData:(gpointer)userData cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_gdata_session_tasks_list_sync([self castedGObject], [tasklistId UTF8String], query, cb, userData, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)tasksMoveSyncWithTasklistId:(OFString*)tasklistId taskId:(OFString*)taskId parentTaskId:(OFString*)parentTaskId previousTaskId:(OFString*)previousTaskId cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_gdata_session_tasks_move_sync([self castedGObject], [tasklistId UTF8String], [taskId UTF8String], [parentTaskId UTF8String], [previousTaskId UTF8String], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)tasksPatchSyncWithTasklistId:(OFString*)tasklistId taskId:(OFString*)taskId taskProperties:(OGJsonBuilder*)taskProperties outPatchedTask:(JsonObject**)outPatchedTask cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_gdata_session_tasks_patch_sync([self castedGObject], [tasklistId UTF8String], [taskId UTF8String], [taskProperties castedGObject], outPatchedTask, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)tasksUpdateSyncWithTasklistId:(OFString*)tasklistId taskId:(OFString*)taskId task:(OGJsonBuilder*)task outUpdatedTask:(JsonObject**)outUpdatedTask cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_gdata_session_tasks_update_sync([self castedGObject], [tasklistId UTF8String], [taskId UTF8String], [task castedGObject], outUpdatedTask, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}


@end