/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <libedataserver/libedataserver.h>


@class OGESource;
@class OGJsonBuilder;
@class OGCancellable;

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGEGDataSession : ESoupSession
{

}


/**
 * Constructors
 */
- (instancetype)init:(OGESource*)source;

/**
 * Methods
 */

- (EGDataSession*)castedGObject;

/**
 * Deletes a task list @tasklist_id.
 *
 * @param tasklistId id of a task list
 * @param cancellable optional #GCancellable object, or %NULL
 * @return whether succeeded
 */
- (bool)tasklistsDeleteSyncWithTasklistId:(OFString*)tasklistId cancellable:(OGCancellable*)cancellable;

/**
 * Gets a task list @tasklist_id and returns it as a #JsonObject,
 * which should be freed with json_object_unref(), when no longer needed.
 * 
 * There can be used e_gdata_tasklist_get_id(), e_gdata_tasklist_get_etag(),
 * e_gdata_tasklist_get_title(), e_gdata_tasklist_get_self_link(),
 * e_gdata_tasklist_get_updated() to read the properties of the task list.
 *
 * @param tasklistId id of a task list
 * @param outTasklist tasklist object
 * @param cancellable optional #GCancellable object, or %NULL
 * @return whether succeeded
 */
- (bool)tasklistsGetSyncWithTasklistId:(OFString*)tasklistId outTasklist:(JsonObject**)outTasklist cancellable:(OGCancellable*)cancellable;

/**
 * Creates a new task list, titled @title. The @out_inserted_tasklist should
 * be freed with json_object_unref(), when no longer needed.
 *
 * @param title title to set
 * @param outInsertedTasklist the created task list
 * @param cancellable optional #GCancellable object, or %NULL
 * @return whether succeeded
 */
- (bool)tasklistsInsertSyncWithTitle:(OFString*)title outInsertedTasklist:(JsonObject**)outInsertedTasklist cancellable:(OGCancellable*)cancellable;

/**
 * Lists all configured task lists for the user, calling the @cb for each of them.
 *
 * @param query an #EGDataQuery to limit returned task lists, or %NULL
 * @param cb an #EGDataObjectCallback to call for each found task list
 * @param userData user data passed to the @cb
 * @param cancellable optional #GCancellable object, or %NULL
 * @return whether succeeded
 */
- (bool)tasklistsListSyncWithQuery:(EGDataQuery*)query cb:(EGDataObjectCallback)cb userData:(gpointer)userData cancellable:(OGCancellable*)cancellable;

/**
 * Changes properties of a task list @tasklist_id.
 * 
 * If not %NULL, free the @out_patched_tasklist with json_object_unref(),
 * when no longer needed.
 *
 * @param tasklistId id of a task list
 * @param tasklistProperties task list properties to change
 * @param outPatchedTasklist where to store patched task list, or %NULL
 * @param cancellable optional #GCancellable object, or %NULL
 * @return whether succeeded
 */
- (bool)tasklistsPatchSyncWithTasklistId:(OFString*)tasklistId tasklistProperties:(OGJsonBuilder*)tasklistProperties outPatchedTasklist:(JsonObject**)outPatchedTasklist cancellable:(OGCancellable*)cancellable;

/**
 * Updates a task list @tasklist_id with values from the @tasklist.
 *
 * @param tasklistId id of a task list
 * @param tasklist task list object to update the task list with
 * @param outUpdatedTasklist where to store updated task list, or %NULL
 * @param cancellable optional #GCancellable object, or %NULL
 * @return whether succeeded
 */
- (bool)tasklistsUpdateSyncWithTasklistId:(OFString*)tasklistId tasklist:(OGJsonBuilder*)tasklist outUpdatedTasklist:(JsonObject**)outUpdatedTasklist cancellable:(OGCancellable*)cancellable;

/**
 * Clears all completed tasks from the task list @tasklist_id. The affected tasks
 * will be marked as 'hidden' and no longer be returned by default when retrieving
 * all tasks for a task list.
 *
 * @param tasklistId id of a task list
 * @param cancellable optional #GCancellable object, or %NULL
 * @return whether succeeded
 */
- (bool)tasksClearSyncWithTasklistId:(OFString*)tasklistId cancellable:(OGCancellable*)cancellable;

/**
 * Deletes a task @task_id from a task list @tasklist_id.
 *
 * @param tasklistId id of a task list
 * @param taskId id of a task
 * @param cancellable optional #GCancellable object, or %NULL
 * @return whether succeeded
 */
- (bool)tasksDeleteSyncWithTasklistId:(OFString*)tasklistId taskId:(OFString*)taskId cancellable:(OGCancellable*)cancellable;

/**
 * Gets a task @task_id from a task list @tasklist_id and returns it as a #JsonObject,
 * which should be freed with json_object_unref(), when no longer needed.
 * 
 * There can be used e_gdata_task_get_id(), e_gdata_task_get_etag(),
 * e_gdata_task_get_title() and other e_gdata_task_... functions
 * to read the properties of the task.
 *
 * @param tasklistId id of a task list
 * @param taskId id of a task
 * @param outTask task object
 * @param cancellable optional #GCancellable object, or %NULL
 * @return whether succeeded
 */
- (bool)tasksGetSyncWithTasklistId:(OFString*)tasklistId taskId:(OFString*)taskId outTask:(JsonObject**)outTask cancellable:(OGCancellable*)cancellable;

/**
 * Creates a new task @task in the task list @tasklist_id. The @out_inserted_task should
 * be freed with json_object_unref(), when no longer needed.
 *
 * @param tasklistId id of a task list
 * @param task a #JsonBuilder with the task object
 * @param parentTaskId parent task identifier, or %NULL to create at the top-level
 * @param previousTaskId previous sibling task identifier, or %NULL to create at the first position among its siblings
 * @param outInsertedTask the created task
 * @param cancellable optional #GCancellable object, or %NULL
 * @return whether succeeded
 */
- (bool)tasksInsertSyncWithTasklistId:(OFString*)tasklistId task:(OGJsonBuilder*)task parentTaskId:(OFString*)parentTaskId previousTaskId:(OFString*)previousTaskId outInsertedTask:(JsonObject**)outInsertedTask cancellable:(OGCancellable*)cancellable;

/**
 * Lists all tasks in the task list @tasklist_id, calling the @cb for each of them.
 *
 * @param tasklistId id of a task list
 * @param query an #EGDataQuery to limit returned tasks, or %NULL
 * @param cb an #EGDataObjectCallback to call for each found task
 * @param userData user data passed to the @cb
 * @param cancellable optional #GCancellable object, or %NULL
 * @return whether succeeded
 */
- (bool)tasksListSyncWithTasklistId:(OFString*)tasklistId query:(EGDataQuery*)query cb:(EGDataObjectCallback)cb userData:(gpointer)userData cancellable:(OGCancellable*)cancellable;

/**
 * Moves the specified task @task_id to another position in the task
 * list @tasklist_id. This can include putting it as a child task under
 * a new parent and/or move it to a different position among its sibling tasks.
 *
 * @param tasklistId id of a task list
 * @param taskId id of a task
 * @param parentTaskId parent task identifier, or %NULL to move at the top-level
 * @param previousTaskId previous sibling task identifier, or %NULL to move at the first position among its siblings
 * @param cancellable optional #GCancellable object, or %NULL
 * @return whether succeeded
 */
- (bool)tasksMoveSyncWithTasklistId:(OFString*)tasklistId taskId:(OFString*)taskId parentTaskId:(OFString*)parentTaskId previousTaskId:(OFString*)previousTaskId cancellable:(OGCancellable*)cancellable;

/**
 * Changes properties @task_properties of a task @task_id in the task list @tasklist_id.
 * 
 * If not %NULL, free the @out_patched_task with json_object_unref(),
 * when no longer needed.
 *
 * @param tasklistId id of a task list
 * @param taskId id of a task
 * @param taskProperties task properties to change
 * @param outPatchedTask where to set patches task, or %NULL
 * @param cancellable optional #GCancellable object, or %NULL
 * @return whether succeeded
 */
- (bool)tasksPatchSyncWithTasklistId:(OFString*)tasklistId taskId:(OFString*)taskId taskProperties:(OGJsonBuilder*)taskProperties outPatchedTask:(JsonObject**)outPatchedTask cancellable:(OGCancellable*)cancellable;

/**
 * Updates a task @task_id in a task list @tasklist_id to the values from the @task.
 *
 * @param tasklistId id of a task list
 * @param taskId id of a task
 * @param task task object to update the task with
 * @param outUpdatedTask where to store updated task, or %NULL
 * @param cancellable optional #GCancellable object, or %NULL
 * @return whether succeeded
 */
- (bool)tasksUpdateSyncWithTasklistId:(OFString*)tasklistId taskId:(OFString*)taskId task:(OGJsonBuilder*)task outUpdatedTask:(JsonObject**)outUpdatedTask cancellable:(OGCancellable*)cancellable;

@end