AC_INIT(OGEBook, 1.2, unkown@host.com)
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
	AC_SUBST(OGEBOOK_SHARED_LIB, "${LIB_PREFIX}ogebook${LIB_SUFFIX}")

	BUILDSYS_FRAMEWORK([
		AC_SUBST(OGEBOOK_FRAMEWORK, "OGEBook.framework")
	])
])
AC_ARG_ENABLE(static, AS_HELP_STRING([--enable-static], [build static library]))
AS_IF([test x"$enable_static" = x"yes" -o x"$enable_shared" = x"no"], [
	AC_PATH_TOOL(AR, ar)
	AC_PROG_RANLIB
	AC_SUBST(OGEBOOK_STATIC_LIB, "libogebook.a")
])

AC_MSG_CHECKING(for ObjFW package OGObject)
AS_IF([$OBJFW_CONFIG --package OGObject], [AC_MSG_RESULT(yes)
	CPPFLAGS="$CPPFLAGS $($OBJFW_CONFIG --package OGObject --cppflags)"
	LIBS="$LIBS $($OBJFW_CONFIG --package OGObject --libs)"
], [
	AC_MSG_ERROR(You need ObjFW package OGObject installed.)
])
AC_MSG_CHECKING(for ObjFW package OGCamel)
AS_IF([$OBJFW_CONFIG --package OGCamel], [AC_MSG_RESULT(yes)
	CPPFLAGS="$CPPFLAGS $($OBJFW_CONFIG --package OGCamel --cppflags)"
	LIBS="$LIBS $($OBJFW_CONFIG --package OGCamel --libs)"
], [
	AC_MSG_ERROR(You need ObjFW package OGCamel installed.)
])

AC_MSG_CHECKING(for ObjFW package OGEBookContacts)
AS_IF([$OBJFW_CONFIG --package OGEBookContacts], [AC_MSG_RESULT(yes)
	CPPFLAGS="$CPPFLAGS $($OBJFW_CONFIG --package OGEBookContacts --cppflags)"
	LIBS="$LIBS $($OBJFW_CONFIG --package OGEBookContacts --libs)"
], [
	AC_MSG_ERROR(You need ObjFW package OGEBookContacts installed.)
])

AC_MSG_CHECKING(for ObjFW package OGEDataServer)
AS_IF([$OBJFW_CONFIG --package OGEDataServer], [AC_MSG_RESULT(yes)
	CPPFLAGS="$CPPFLAGS $($OBJFW_CONFIG --package OGEDataServer --cppflags)"
	LIBS="$LIBS $($OBJFW_CONFIG --package OGEDataServer --libs)"
], [
	AC_MSG_ERROR(You need ObjFW package OGEDataServer installed.)
])

AC_MSG_CHECKING(for ObjFW package OGio)
AS_IF([$OBJFW_CONFIG --package OGio], [AC_MSG_RESULT(yes)
	CPPFLAGS="$CPPFLAGS $($OBJFW_CONFIG --package OGio --cppflags)"
	LIBS="$LIBS $($OBJFW_CONFIG --package OGio --libs)"
], [
	AC_MSG_ERROR(You need ObjFW package OGio installed.)
])


AC_ARG_WITH(libebook, AS_HELP_STRING([--with-libebook=PREFIX],
	[build with libebook-1.2 in the specified prefix]))
AS_IF([test x"$with_libebook" != x"no" -a x"$with_libebook" != x""], [
       OGEBOOK_CPPFLAGS="$OGEBOOK_CPPFLAGS -I$with_libebook/include"
       OGEBOOK_LIBS="$OGEBOOK_LIBS -L$with_libebook/lib"
       CPPFLAGS="-I$with_libebook/include $CPPFLAGS"
       LIBS="-L$with_libebook/lib $LIBS"
       FRAMEWORK_LIBS="-L$with_libebook/lib $FRAMEWORK_LIBS"
])


PKG_CHECK_MODULES(libebook, [libebook-1.2 >= $(pkg-config --modversion libebook-1.2)], [
	OGEBOOK_CPPFLAGS="$OGEBOOK_CPPFLAGS $libebook_CFLAGS"
	OGEBOOK_LIBS="$OGEBOOK_LIBS $libebook_LIBS"
	CPPFLAGS="$CPPFLAGS $libebook_CFLAGS"
	LIBS="$LIBS $libebook_LIBS"
], [
	AC_MSG_ERROR(You need libebook-1.2 >= $(pkg-config --modversion libebook-1.2) installed!)
])

AS_IF([test x"$GOBJC" = x"yes"], [
	OBJCFLAGS="$OBJCFLAGS -Wwrite-strings -Wpointer-arith -Werror"
])

BUILDSYS_INIT

dnl We don't call AC_PROG_CPP, but only AC_PROG_OBJCPP and set CPP to OBJCPP
dnl and add OBJCPPFLAGS to CPPFLAGS, thus we need to AC_SUBST these ourself.
AC_SUBST(CPP)
AC_SUBST(CPPFLAGS)

AC_SUBST(OGEBOOK_CPPFLAGS)
AC_SUBST(OGEBOOK_LIBS)

AC_CONFIG_FILES([buildsys.mk extra.mk OGEBook.oc])
AC_OUTPUT
