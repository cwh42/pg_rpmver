#include <postgres.h>
#include <fmgr.h>
#include <utils/builtins.h>
#include <rpm/rpmlib.h>

PG_MODULE_MAGIC;

PG_FUNCTION_INFO_V1(rpmver_lt);

Datum
rpmver_lt(PG_FUNCTION_ARGS)
{
	const char    *a = text_to_cstring(PG_GETARG_TEXT_PP(0));
	const char    *b = text_to_cstring(PG_GETARG_TEXT_PP(1));

	PG_RETURN_BOOL(rpmvercmp(a, b) < 0);
}

PG_FUNCTION_INFO_V1(rpmver_le);

Datum
rpmver_le(PG_FUNCTION_ARGS)
{
	const char    *a = text_to_cstring(PG_GETARG_TEXT_PP(0));
	const char    *b = text_to_cstring(PG_GETARG_TEXT_PP(1));

	PG_RETURN_BOOL(rpmvercmp(a, b) <= 0);
}

PG_FUNCTION_INFO_V1(rpmver_eq);

Datum
rpmver_eq(PG_FUNCTION_ARGS)
{
	const char    *a = text_to_cstring(PG_GETARG_TEXT_PP(0));
	const char    *b = text_to_cstring(PG_GETARG_TEXT_PP(1));

	PG_RETURN_BOOL(rpmvercmp(a, b) == 0);
}

PG_FUNCTION_INFO_V1(rpmver_ge);

Datum
rpmver_ge(PG_FUNCTION_ARGS)
{
	const char    *a = text_to_cstring(PG_GETARG_TEXT_PP(0));
	const char    *b = text_to_cstring(PG_GETARG_TEXT_PP(1));

	PG_RETURN_BOOL(rpmvercmp(a, b) >= 0);
}

PG_FUNCTION_INFO_V1(rpmver_gt);

Datum
rpmver_gt(PG_FUNCTION_ARGS)
{
	const char    *a = text_to_cstring(PG_GETARG_TEXT_PP(0));
	const char    *b = text_to_cstring(PG_GETARG_TEXT_PP(1));

	PG_RETURN_BOOL(rpmvercmp(a, b) > 0);
}

PG_FUNCTION_INFO_V1(rpmver_cmp);

Datum
rpmver_cmp(PG_FUNCTION_ARGS)
{
	const char    *a = text_to_cstring(PG_GETARG_TEXT_PP(0));
	const char    *b = text_to_cstring(PG_GETARG_TEXT_PP(1));

	return rpmvercmp(a, b);
}
