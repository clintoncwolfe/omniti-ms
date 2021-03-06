if [ -z $1 ]; then
    echo "Usage: $0 <pg94 minor version number>"
    exit 1
fi

MINOR=$1

VER="9.4.$MINOR"
PGVER="94$MINOR"

echo "Building postgresql-$PGVER and all extensions..."

VER=$VER ../postgres94/build.sh -b
sudo pkg install -g file:///export/home/vagrant/omniti-ms/tmp.repo postgresql-$PGVER
VER=$VER ../pg94-dblink/build.sh -b
VER=$VER ../pg94-pg_stat_statements/build.sh -b
PGVER=$PGVER ../pg94-pg_query_statsd/build.sh -b
PGVER=$PGVER ../pg94-mimeo/build.sh -b
PGVER=$PGVER ../pg94-pg_jobmon/build.sh -b
PGVER=$PGVER ../pg94-pg_partman/build.sh -b
VER=$VER ../pg94-plperl/build.sh -d 5.20 -b
VER=$VER ../pg94-pgcrypto/build.sh -b
VER=$VER ../pg94-fuzzystrmatch/build.sh -b
VER=$VER ../pg94-hstore/build.sh -b
VER=$VER ../pg94-btree_gist/build.sh -b
VER=$VER ../pg94-pg_buffercache/build.sh -b
VER=$VER ../pg94-pg_upgrade/build.sh -b
PGVER=$PGVER ../pg94-pg_repack/build.sh -b
VER=$VER ../pg94-tablefunc/build.sh -b
