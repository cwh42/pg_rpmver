EXTENSION = rpmvercmp 
MODULES = rpmvercmp
DATA = rpmvercmp--0.9.0.sql
OBJS = rpmvercmp.o 
PG_LDFLAGS := $(shell pkg-config rpm --libs)
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
