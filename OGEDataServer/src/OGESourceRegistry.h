/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <libedataserver/libedataserver.h>

#import <OGObject/OGObject.h>

@class OGCancellable;
@class OGEOAuth2Services;
@class OGESource;

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGESourceRegistry : OGObject
{

}

/**
 * Functions
 */

/**
 *
 * @return Whether debugging is enabled, that is,
 * whether e_source_registry_debug_print() will produce any output.
 */
+ (bool)debugEnabled;

/**
 * Convenience function to free a #GNode tree of registered
 * sources created by e_source_registry_build_display_tree().
 *
 * @param displayTree a tree of sources, arranged for display
 */
+ (void)freeDisplayTree:(GNode*)displayTree;

/**
 * Asynchronously creates a new #ESourceRegistry front-end for the registry
 * D-Bus service.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call e_source_registry_new_finish() to get the result of the operation.
 * 
 * Since 3.12 a singleton will be returned.  No strong reference is kept
 * internally, so it is the caller's responsibility to keep one.
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
+ (void)newWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Constructors
 */
- (instancetype)initFinish:(GAsyncResult*)result;
- (instancetype)initSync:(OGCancellable*)cancellable;

/**
 * Methods
 */

- (ESourceRegistry*)castedGObject;

/**
 * Returns a single #GNode tree of registered sources that can be used to
 * populate a #GtkTreeModel.  (The root #GNode is just an empty placeholder.)
 * 
 * Similar to e_source_registry_list_sources(), an @extension_name can be
 * given to restrict the tree to sources having that extension name.  Parents
 * of matched sources are included in the tree regardless of whether they have
 * an extension named @extension_name.
 * 
 * Disabled leaf nodes are automatically excluded from the #GNode tree.
 * 
 * The sources returned in the tree are referenced for thread-safety.
 * They must each be unreferenced with g_object_unref() when finished
 * with them.  Free the returned tree itself with g_node_destroy().
 * For convenience, e_source_registry_free_display_tree() does all
 * that in one step.
 *
 * @param extensionName an extension name, or %NULL
 * @return a tree of sources,
 *          arranged for display
 */
- (GNode*)buildDisplayTree:(OFString*)extensionName;

/**
 * Determines whether @source is "effectively" enabled by examining its
 * own #ESource:enabled property as well as those of its ancestors in the
 * #ESource hierarchy.  If all examined #ESource:enabled properties are
 * %TRUE, then the function returns %TRUE.  If any are %FALSE, then the
 * function returns %FALSE.
 * 
 * Use this function instead of e_source_get_enabled() to determine
 * things like whether to display an #ESource in a user interface or
 * whether to act on the data set described by the #ESource.
 *
 * @param source an #ESource
 * @return whether @source is "effectively" enabled
 */
- (bool)checkEnabled:(OGESource*)source;

/**
 * See e_source_registry_commit_source_sync() for details.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call e_source_registry_commit_source_finish() to get the result of the
 * operation.
 *
 * @param source an #ESource with changes to commit
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)commitSourceWithSource:(OGESource*)source cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with e_source_registry_commit_source().
 * 
 * If an error occurred, the function will set @error and return %FALSE.
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on failure
 */
- (bool)commitSourceFinish:(GAsyncResult*)result;

/**
 * This is a convenience function intended for use with graphical
 * #ESource editors.  Call this function when the user is finished
 * making changes to @source.
 * 
 * If @source has a #GDBusObject, its contents are submitted to the D-Bus
 * service through e_source_write_sync().
 * 
 * If @source does NOT have a #GDBusObject (implying it's a scratch
 * #ESource), its contents are submitted to the D-Bus service through
 * either e_source_remote_create_sync() if @source is to be a collection
 * member, or e_source_registry_create_sources_sync() if @source to be an
 * independent data source.
 * 
 * If an error occurs, the function will set @error and return %FALSE.
 *
 * @param source an #ESource with changes to commit
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on failure
 */
- (bool)commitSourceSyncWithSource:(OGESource*)source cancellable:(OGCancellable*)cancellable;

/**
 * Asynchronously requests the D-Bus service create new key files for each
 * #ESource in @list_of_sources.  Each list element must be a scratch
 * #ESource with no #GDBusObject.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call e_source_registry_create_sources_finish() to get the result of the
 * operation.
 *
 * @param listOfSources a list of #ESource instances with
 * no #GDBusObject
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)createSourcesWithListOfSources:(GList*)listOfSources cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with e_source_registry_create_sources().
 * 
 * If an error occurred, the function will set @error and return %FALSE.
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on failure
 */
- (bool)createSourcesFinish:(GAsyncResult*)result;

/**
 * Requests the D-Bus service create new key files for each #ESource in
 * @list_of_sources.  Each list element must be a scratch #ESource with
 * no #GDBusObject.
 * 
 * If an error occurs, the function will set @error and return %FALSE.
 *
 * @param listOfSources a list of #ESource instances with
 * no #GDBusObject
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on failure
 */
- (bool)createSourcesSyncWithListOfSources:(GList*)listOfSources cancellable:(OGCancellable*)cancellable;

/**
 * Handy debugging function that uses e_source_registry_build_display_tree()
 * to print a tree of registered sources to standard output.
 *
 * @param extensionName an extension name, or %NULL
 */
- (void)debugDump:(OFString*)extensionName;

/**
 * Compares @source's #ESource:display-name against other sources having
 * an #ESourceExtension named @extension_name, if given, or else against
 * all other sources in the @registry.
 * 
 * If @sources's #ESource:display-name is unique among these other sources,
 * the function will return the #ESource:display-name verbatim.  Otherwise
 * the function will construct a string that includes the @sources's own
 * #ESource:display-name as well as those of its ancestors.
 * 
 * The function's return value is intended to be used in messages shown to
 * the user to help clarify which source is being referred to.  It assumes
 * @source's #ESource:display-name is at least unique among its siblings.
 * 
 * Free the returned string with g_free() when finished with it.
 *
 * @param source an #ESource
 * @param extensionName an extension name, or %NULL
 * @return a unique display name for @source
 */
- (OFString*)dupUniqueDisplayNameWithSource:(OGESource*)source extensionName:(OFString*)extensionName;

/**
 * Examines @source and its ancestors and returns the "deepest" #ESource
 * having an #ESourceExtension with the given @extension_name.  If neither
 * @source nor any of its ancestors have such an extension, the function
 * returns %NULL.
 * 
 * This function is useful in cases when an #ESourceExtension is meant to
 * apply to both the #ESource it belongs to and the #ESource's descendants.
 * 
 * A common example is the #ESourceCollection extension, where descendants
 * of an #ESource having an #ESourceCollection extension are implied to be
 * members of that collection.  In that example, this function can be used
 * to test whether @source is a member of a collection.
 * 
 * The returned #ESource is referenced for thread-safety and must be
 * unreferenced with g_object_unref() when finished with it.
 * 
 * Note the function returns the #ESource containing the #ESourceExtension
 * instead of the #ESourceExtension itself because extension instances are
 * not to be referenced directly (see e_source_get_extension()).
 *
 * @param source an #ESource
 * @param extensionName the extension name to find
 * @return an #ESource, or %NULL if no match was found
 */
- (OGESource*)findExtensionWithSource:(OGESource*)source extensionName:(OFString*)extensionName;

/**
 *
 * @return an instance of #EOAuth2Services, owned by @registry
 */
- (OGEOAuth2Services*)oauth2Services;

/**
 * Similar to e_source_registry_list_sources(), but returns only enabled
 * sources according to e_source_registry_check_enabled().
 * 
 * The sources returned in the list are referenced for thread-safety.
 * They must each be unreferenced with g_object_unref() when finished
 * with them.  Free the returned list itself with g_list_free().
 * 
 * An easy way to free the list properly in one step is as follows:
 * 
 * |[
 *   g_list_free_full (list, g_object_unref);
 * ]|
 *
 * @param extensionName an extension name, or %NULL
 * @return a sorted list of sources
 */
- (GList*)listEnabled:(OFString*)extensionName;

/**
 * Returns a list of registered sources, sorted by display name.  If
 * @extension_name is given, restrict the list to sources having that
 * extension name.
 * 
 * The sources returned in the list are referenced for thread-safety.
 * They must each be unreferenced with g_object_unref() when finished
 * with them.  Free the returned list itself with g_list_free().
 * 
 * An easy way to free the list properly in one step is as follows:
 * 
 * |[
 *   g_list_free_full (list, g_object_unref);
 * ]|
 *
 * @param extensionName an extension name, or %NULL
 * @return a sorted list of sources
 */
- (GList*)listSources:(OFString*)extensionName;

/**
 * Returns the built-in address book #ESource.
 * 
 * This #ESource is always present and makes for a safe fallback.
 * 
 * The returned #ESource is referenced for thread-safety and must be
 * unreferenced with g_object_unref() when finished with it.
 *
 * @return the built-in address book #ESource
 */
- (OGESource*)refBuiltinAddressBook;

/**
 * Returns the built-in calendar #ESource.
 * 
 * This #ESource is always present and makes for a safe fallback.
 * 
 * The returned #ESource is referenced for thread-safety and must be
 * unreferenced with g_object_unref() when finished with it.
 *
 * @return the built-in calendar #ESource
 */
- (OGESource*)refBuiltinCalendar;

/**
 * Returns the built-in mail account #ESource.
 * 
 * This #ESource is always present and makes for a safe fallback.
 * 
 * The returned #ESource is referenced for thread-safety and must be
 * unreferenced with g_object_unref() when finished with it.
 *
 * @return the built-in mail account #ESource
 */
- (OGESource*)refBuiltinMailAccount;

/**
 * Returns the built-in memo list #ESource.
 * 
 * This #ESource is always present and makes for a safe fallback.
 * 
 * The returned #ESource is referenced for thread-safety and must be
 * unreferenced with g_object_unref() when finished with it.
 *
 * @return the built-in memo list #ESource
 */
- (OGESource*)refBuiltinMemoList;

/**
 * Returns the built-in proxy profile #ESource.
 * 
 * This #ESource is always present and makes for a safe fallback.
 * 
 * The returned #ESource is referenced for thread-safety and must be
 * unreferenced with g_object_unref() when finished with it.
 *
 * @return the built-in proxy profile #ESource
 */
- (OGESource*)refBuiltinProxy;

/**
 * Returns the built-in task list #ESource.
 * 
 * This #ESource is always present and makes for a safe fallback.
 * 
 * The returned #ESource is referenced for thread-safety and must be
 * unreferenced with g_object_unref() when finished with it.
 *
 * @return the built-in task list #ESource
 */
- (OGESource*)refBuiltinTaskList;

/**
 * Returns the #ESource most recently passed to
 * e_source_registry_set_default_address_book() either in this session
 * or a previous session, or else falls back to the built-in address book.
 * 
 * The returned #ESource is referenced for thread-safety and must be
 * unreferenced with g_object_unref() when finished with it.
 *
 * @return the default address book #ESource
 */
- (OGESource*)refDefaultAddressBook;

/**
 * Returns the #ESource most recently passed to
 * e_source_registry_set_default_calendar() either in this session
 * or a previous session, or else falls back to the built-in calendar.
 * 
 * The returned #ESource is referenced for thread-safety and must be
 * unreferenced with g_object_unref() when finished with it.
 *
 * @return the default calendar #ESource
 */
- (OGESource*)refDefaultCalendar;

/**
 * This is a convenience function to return a default #ESource based on
 * @extension_name.  This only works with a subset of extension names.
 * 
 * If @extension_name is #E_SOURCE_EXTENSION_ADDRESS_BOOK, the function
 * returns the current default address book, or else falls back to the
 * built-in address book.
 * 
 * If @extension_name is #E_SOURCE_EXTENSION_CALENDAR, the function returns
 * the current default calendar, or else falls back to the built-in calendar.
 * 
 * If @extension_name is #E_SOURCE_EXTENSION_MAIL_ACCOUNT, the function
 * returns the current default mail account, or else falls back to the
 * built-in mail account.
 * 
 * If @extension_name is #E_SOURCE_EXTENSION_MAIL_IDENTITY, the function
 * returns the current default mail identity, or else falls back to the
 * mail identity named by the current default mail account.
 * 
 * If @extension_name is #E_SOURCE_EXTENSION_MEMO_LIST, the function returns
 * the current default memo list, or else falls back to the built-in memo list.
 * 
 * If @extension_name is #E_SOURCE_EXTENSION_TASK_LIST, the function returns
 * the current default task list, or else falls back to the built-in task list.
 * 
 * For all other values of @extension_name, the function returns %NULL.
 * 
 * The returned #ESource is referenced for thread-safety and must be
 * unreferenced with g_object_unref() when finished with it.
 *
 * @param extensionName an extension_name
 * @return the default #ESource based on @extension_name
 */
- (OGESource*)refDefaultForExtensionName:(OFString*)extensionName;

/**
 * Returns the #ESource most recently passed to
 * e_source_registry_set_default_mail_account() either in this session
 * or a previous session, or else falls back to the built-in mail account.
 * 
 * The returned #ESource is referenced for thread-safety and must be
 * unreferenced with g_object_unref() when finished with it.
 *
 * @return the default mail account #ESource
 */
- (OGESource*)refDefaultMailAccount;

/**
 * Returns the #ESource most recently passed to
 * e_source_registry_set_default_mail_identity() either in this session
 * or a previous session, or else falls back to the mail identity named
 * by the default mail account.  If even that fails it returns any mail
 * identity from @registry, or %NULL if there are none.
 * 
 * The returned #ESource is referenced for thread-safety and must be
 * unreferenced with g_object_unref() when finished with it.
 *
 * @return the default mail identity #ESource,
 *    or %NULL
 */
- (OGESource*)refDefaultMailIdentity;

/**
 * Returns the #ESource most recently passed to
 * e_source_registry_set_default_memo_list() either in this session
 * or a previous session, or else falls back to the built-in memo list.
 * 
 * The returned #ESource is referenced for thread-safety and must be
 * unreferenced with g_object_unref() when finished with it.
 *
 * @return the default memo list #ESource
 */
- (OGESource*)refDefaultMemoList;

/**
 * Returns the #ESource most recently passed to
 * e_source_registry_set_default_task_list() either in this session
 * or a previous session, or else falls back to the built-in task list.
 * 
 * The returned #ESource is referenced for thread-safety and must be
 * unreferenced with g_object_unref() when finished with it.
 *
 * @return the default task list #ESource
 */
- (OGESource*)refDefaultTaskList;

/**
 * Looks up an #ESource in @registry by its unique identifier string.
 * 
 * The returned #ESource is referenced for thread-safety and must be
 * unreferenced with g_object_unref() when finished with it.
 *
 * @param uid a unique identifier string
 * @return an #ESource, or %NULL if no match was found
 */
- (OGESource*)refSource:(OFString*)uid;

/**
 * Asynchronously requests the D-Bus service to refresh collection backend
 * for an #ESource with UID @source_uid. The result means that the refresh
 * had been scheduled not whether the refresh itself succeeded. The refresh
 * is not initiated when the collection backend is offline.
 * 
 * When the operation is finished, @callback will be called. You can then
 * call e_source_registry_refresh_backend_finish() to get the result of
 * the operation.
 *
 * @param sourceUid UID of a collection #ESource whose backend to refresh
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)refreshBackendWithSourceUid:(OFString*)sourceUid cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with e_source_registry_refresh_backend().
 * 
 * If an error occurred, the function will set @error and return %FALSE.
 *
 * @param result a #GAsyncResult
 * @return Whether succeeded
 */
- (bool)refreshBackendFinish:(GAsyncResult*)result;

/**
 * Requests the D-Bus service to refresh collection backend for an #ESource
 * with UID @source_uid. The result means that the refresh had been scheduled
 * not whether the refresh itself succeeded. The refresh is not initiated
 * when the collection backend is offline.
 * 
 * If an error occurs, the function will set @error and return %FALSE.
 *
 * @param sourceUid UID of a collection #ESource whose backend to refresh
 * @param cancellable optional #GCancellable object, or %NULL
 * @return Whether succeeded
 */
- (bool)refreshBackendSyncWithSourceUid:(OFString*)sourceUid cancellable:(OGCancellable*)cancellable;

/**
 * Sets @default_source as the default address book.  If @default_source
 * is %NULL, the default address book is reset to the built-in address book.
 * This setting will persist across sessions until changed.
 *
 * @param defaultSource an address book #ESource, or %NULL
 */
- (void)setDefaultAddressBook:(OGESource*)defaultSource;

/**
 * Sets @default_source as the default calendar.  If @default_source
 * is %NULL, the default calendar is reset to the built-in calendar.
 * This setting will persist across sessions until changed.
 *
 * @param defaultSource a calendar #ESource, or %NULL
 */
- (void)setDefaultCalendar:(OGESource*)defaultSource;

/**
 * This is a convenience function to set a default #ESource based on
 * @extension_name.  This only works with a subset of extension names.
 * 
 * If @extension_name is #E_SOURCE_EXTENSION_ADDRESS_BOOK, the function
 * sets @default_source as the default address book.  If @default_source
 * is %NULL, the default address book is reset to the built-in address book.
 * 
 * If @extension_name is #E_SOURCE_EXTENSION_CALENDAR, the function sets
 * @default_source as the default calendar.  If @default_source is %NULL,
 * the default calendar is reset to the built-in calendar.
 * 
 * If @extension_name is #E_SOURCE_EXTENSION_MAIL_ACCOUNT, the function
 * sets @default_source as the default mail account.  If @default_source
 * is %NULL, the default mail account is reset to the built-in mail account.
 * 
 * If @extension_name is #E_SOURCE_EXTENSION_MAIL_IDENTITY, the function
 * sets @default_source as the default mail identity.  If @default_source
 * is %NULL, the next request for the default mail identity will return
 * the mail identity named by the default mail account.
 * 
 * If @extension_name is #E_SOURCE_EXTENSION_MEMO_LIST, the function sets
 * @default_source as the default memo list.  If @default_source is %NULL,
 * the default memo list is reset to the built-in memo list.
 * 
 * If @extension_name is #E_SOURCE_EXTENSION_TASK_LIST, the function sets
 * @default_source as the default task list.  If @default_source is %NULL,
 * the default task list is reset to the built-in task list.
 * 
 * For all other values of @extension_name, the function does nothing.
 *
 * @param extensionName an extension name
 * @param defaultSource an #ESource, or %NULL
 */
- (void)setDefaultForExtensionNameWithExtensionName:(OFString*)extensionName defaultSource:(OGESource*)defaultSource;

/**
 * Sets @default_source as the default mail account.  If @default_source
 * is %NULL, the default mail account is reset to the built-in mail account.
 * This setting will persist across sessions until changed.
 *
 * @param defaultSource a mail account #ESource, or %NULL
 */
- (void)setDefaultMailAccount:(OGESource*)defaultSource;

/**
 * Sets @default_source as the default mail identity.  If @default_source
 * is %NULL, the next request for the default mail identity will use the
 * fallbacks described in e_source_registry_ref_default_mail_identity().
 *
 * @param defaultSource a mail identity #ESource, or %NULL
 */
- (void)setDefaultMailIdentity:(OGESource*)defaultSource;

/**
 * Sets @default_source as the default memo list.  If @default_source
 * is %NULL, the default memo list is reset to the built-in memo list.
 * This setting will persist across sessions until changed.
 *
 * @param defaultSource a memo list #ESource, or %NULL
 */
- (void)setDefaultMemoList:(OGESource*)defaultSource;

/**
 * Sets @default_source as the default task list.  If @default_source
 * is %NULL, the default task list is reset to the built-in task list.
 * This setting will persist across sessions until changed.
 *
 * @param defaultSource a task list #ESource, or %NULL
 */
- (void)setDefaultTaskList:(OGESource*)defaultSource;

@end