AC_INIT(OGEBookContacts, 1.2, unkown@host.com)
AC_CONFIG_SRCDIR(src)
AC_CONFIG_AUX_DIR(build-aux)
AC_CONFIG_MACRO_DIR(build-aux/m4)

for i in configure.ac build-aux/m4/*; do
	AS_IF([test $i -nt configure], [
		AC_MSG_ERROR([$i is newer than configure! Run ./autogen.sh!])
	])
done

AC_CHECK_TOOL(OBJFW_CONFIG, objfw-config)
AS_IF([test x"$OBJFW_CONFIG" = x""], [
	AC_MSG_ERROR(You need ObjFW and objfw-config installed!)
])

test x"$OBJC" = x"" && OBJC="$($OBJFW_CONFIG --objc)"

AC_LANG([Objective C])
AC_PROG_OBJC
AC_PROG_OBJCPP
AC_PROG_LN_S
AC_PROG_INSTALL

CPP="$OBJCPP"
CPPFLAGS="$CPPFLAGS $OBJCPPFLAGS $($OBJFW_CONFIG --cppflags)"
OBJCFLAGS="$OBJCFLAGS -Wall $($OBJFW_CONFIG --objcflags)"
LDFLAGS="$LDFLAGS $($OBJFW_CONFIG --ldflags --rpath)"
FRAMEWORK_LIBS="$($OBJFW_CONFIG --framework-libs)"
LIBS="$($OBJFW_CONFIG --libs --rpath)"

AX_CHECK_COMPILER_FLAGS(-Wno-deprecated-declarations,
	[OBJCFLAGS="$OBJCFLAGS -Wno-deprecated-declarations"])

AX_CHECK_COMPILER_FLAGS(-Wno-deprecated,
	[OBJCFLAGS="$OBJCFLAGS -Wno-deprecated"])

AC_ARG_ENABLE(shared,
	AS_HELP_STRING([--disable-shared], [do not build shared library]))
AS_IF([test x"$enable_shared" != x"no"], [
	BUILDSYS_SHARED_LIB
	AC_SUBST(OGEBOOKCONTACTS_SHARED_LIB, "${LIB_PREFIX}ogebookcontacts${LIB_SUFFIX}")

	BUILDSYS_FRAMEWORK([
		AC_SUBST(OGEBOOKCONTACTS_FRAMEWORK, "OGEBookContacts.framework")
	])
])
AC_ARG_ENABLE(static, AS_HELP_STRING([--enable-static], [build static library]))
AS_IF([test x"$enable_static" = x"yes" -o x"$enable_shared" = x"no"], [
	AC_PATH_TOOL(AR, ar)
	AC_PROG_RANLIB
	AC_SUBST(OGEBOOKCONTACTS_STATIC_LIB, "libogebookcontacts.a")
])

AC_MSG_CHECKING(for ObjFW package OGObject)
AS_IF([$OBJFW_CONFIG --package OGObject], [AC_MSG_RESULT(yes)
	CPPFLAGS="$CPPFLAGS $($OBJFW_CONFIG --package OGObject --cppflags)"
	LIBS="$LIBS $($OBJFW_CONFIG --package OGObject --libs)"
	FRAMEWORK_LIBS="$($OBJFW_CONFIG --package OGObject --framework-libs) $FRAMEWORK_LIBS"
], [
	AC_MSG_ERROR(You need ObjFW package OGObject installed.)
])
AC_MSG_CHECKING(for ObjFW package OGCamel)
AS_IF([$OBJFW_CONFIG --package OGCamel], [AC_MSG_RESULT(yes)
	CPPFLAGS="$CPPFLAGS $($OBJFW_CONFIG --package OGCamel --cppflags)"
	LIBS="$LIBS $($OBJFW_CONFIG --package OGCamel --libs)"
	FRAMEWORK_LIBS="$($OBJFW_CONFIG --package OGCamel --framework-libs) $FRAMEWORK_LIBS"
], [
	AC_MSG_ERROR(You need ObjFW package OGCamel installed.)
])

AC_MSG_CHECKING(for ObjFW package OGEDataServer)
AS_IF([$OBJFW_CONFIG --package OGEDataServer], [AC_MSG_RESULT(yes)
	CPPFLAGS="$CPPFLAGS $($OBJFW_CONFIG --package OGEDataServer --cppflags)"
	LIBS="$LIBS $($OBJFW_CONFIG --package OGEDataServer --libs)"
	FRAMEWORK_LIBS="$($OBJFW_CONFIG --package OGEDataServer --framework-libs) $FRAMEWORK_LIBS"
], [
	AC_MSG_ERROR(You need ObjFW package OGEDataServer installed.)
])

AC_MSG_CHECKING(for ObjFW package OGio)
AS_IF([$OBJFW_CONFIG --package OGio], [AC_MSG_RESULT(yes)
	CPPFLAGS="$CPPFLAGS $($OBJFW_CONFIG --package OGio --cppflags)"
	LIBS="$LIBS $($OBJFW_CONFIG --package OGio --libs)"
	FRAMEWORK_LIBS="$($OBJFW_CONFIG --package OGio --framework-libs) $FRAMEWORK_LIBS"
], [
	AC_MSG_ERROR(You need ObjFW package OGio installed.)
])


AC_ARG_WITH(libebookcontacts, AS_HELP_STRING([--with-libebookcontacts=PREFIX],
	[build with libebook-contacts-1.2 in the specified prefix]))
AS_IF([test x"$with_libebookcontacts" != x"no" -a x"$with_libebookcontacts" != x""], [
       OGEBOOKCONTACTS_CPPFLAGS="$OGEBOOKCONTACTS_CPPFLAGS -I$with_libebookcontacts/include"
       OGEBOOKCONTACTS_LIBS="$OGEBOOKCONTACTS_LIBS -L$with_libebookcontacts/lib"
       CPPFLAGS="-I$with_libebookcontacts/include $CPPFLAGS"
       LIBS="-L$with_libebookcontacts/lib $LIBS"
       FRAMEWORK_LIBS="-L$with_libebookcontacts/lib $FRAMEWORK_LIBS"
])


PKG_CHECK_MODULES(libebookcontacts, [libebook-contacts-1.2 >= 3.52.3], [
	OGEBOOKCONTACTS_CPPFLAGS="$OGEBOOKCONTACTS_CPPFLAGS $libebookcontacts_CFLAGS"
	OGEBOOKCONTACTS_LIBS="$OGEBOOKCONTACTS_LIBS $libebookcontacts_LIBS"
	CPPFLAGS="$CPPFLAGS $libebookcontacts_CFLAGS"
	LIBS="$LIBS $libebookcontacts_LIBS"
	FRAMEWORK_LIBS="$FRAMEWORK_LIBS $libebookcontacts_LIBS"
], [
	AC_MSG_ERROR(You need libebook-contacts-1.2 >= 3.52.3 installed!)
])

AS_IF([test x"$GOBJC" = x"yes"], [
	OBJCFLAGS="$OBJCFLAGS -Wwrite-strings -Wpointer-arith -Werror"
])

BUILDSYS_INIT

dnl We don't call AC_PROG_CPP, but only AC_PROG_OBJCPP and set CPP to OBJCPP
dnl and add OBJCPPFLAGS to CPPFLAGS, thus we need to AC_SUBST these ourself.
AC_SUBST(CPP)
AC_SUBST(CPPFLAGS)

AC_SUBST(OGEBOOKCONTACTS_CPPFLAGS)
AC_SUBST(OGEBOOKCONTACTS_LIBS)

AC_CONFIG_FILES([buildsys.mk extra.mk OGEBookContacts.oc src/Info.plist])
AC_OUTPUT
