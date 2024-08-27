CREATE DOMAIN rpmver AS text;

CREATE FUNCTION rpmver_lt(rpmver, rpmver) RETURNS bool
   AS 'rpmvercmp' LANGUAGE C IMMUTABLE STRICT;
CREATE FUNCTION rpmver_le(rpmver, rpmver) RETURNS bool
   AS 'rpmvercmp' LANGUAGE C IMMUTABLE STRICT;
CREATE FUNCTION rpmver_eq(rpmver, rpmver) RETURNS bool
   AS 'rpmvercmp' LANGUAGE C IMMUTABLE STRICT;
CREATE FUNCTION rpmver_ge(rpmver, rpmver) RETURNS bool
   AS 'rpmvercmp' LANGUAGE C IMMUTABLE STRICT;
CREATE FUNCTION rpmver_gt(rpmver, rpmver) RETURNS bool
   AS 'rpmvercmp' LANGUAGE C IMMUTABLE STRICT;
CREATE FUNCTION rpmver_cmp(rpmver, rpmver) RETURNS int4
   AS 'rpmvercmp' LANGUAGE C IMMUTABLE STRICT;

CREATE OPERATOR < (
   leftarg = rpmver, rightarg = rpmver, procedure = rpmver_lt,
   commutator = > , negator = >= ,
   restrict = scalarltsel, join = scalarltjoinsel
);

CREATE OPERATOR <= (
   leftarg = rpmver, rightarg = rpmver, procedure = rpmver_le,
   commutator = >= , negator = > ,
   restrict = scalarlesel, join = scalarlejoinsel
);
CREATE OPERATOR = (
   leftarg = rpmver, rightarg = rpmver, procedure = rpmver_eq,
   commutator = = ,
   -- leave out negator since we didn't create <> operator
   -- negator = <> ,
   restrict = eqsel, join = eqjoinsel
);
CREATE OPERATOR >= (
   leftarg = rpmver, rightarg = rpmver, procedure = rpmver_ge,
   commutator = <= , negator = < ,
   restrict = scalargesel, join = scalargejoinsel
);
CREATE OPERATOR > (
   leftarg = rpmver, rightarg = rpmver, procedure = rpmver_gt,
   commutator = < , negator = <= ,
   restrict = scalargtsel, join = scalargtjoinsel
);

CREATE OPERATOR CLASS rpmver_ops
    DEFAULT FOR TYPE rpmver USING btree AS
        OPERATOR        1       < ,
        OPERATOR        2       <= ,
        OPERATOR        3       = ,
        OPERATOR        4       >= ,
        OPERATOR        5       > ,
        FUNCTION        1       rpmver_cmp(rpmver, rpmver);
