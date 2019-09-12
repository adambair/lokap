
# `set -e` stops a script if a command or pipeline has an error
set -e

# If you have any questions, please contact adam@backplane.io

usage="The entrypoint for the CI server (currently wercker.com)
All steps can be run at once or separately.

Usage

  Run all the steps in order:

    ./ci.sh  
    
  This is the same as:

    ./ci.sh tests compile archive upload

  Steps can be run individually by passing their function name when you call
  the script:

    ./ci.sh compile

  You can pick and choose which steps you'd like to run:

    ./ci.sh compile archive upload

Options

  tests   - run all the tests
  compile - compile all binaries
  archive - archive the binaries output by 'compile'
  upload  - uploads archive of binaries to S3"

wercker="Wercker (CI server)

The goal here is to keep things simple and not to depend on wercker-specific
steps as possible. Currently we're only using simple 'script' directives in
wercker.yml.

  See ./wercker.yml for build configuration.

You can run wercker locally to test changes to to the build script inside the
wercker env. This requires you to have docker and wercker installed locally.

  X_AWS_KEY= X_AWS_SECRET= X_AWS_REGION= X_AWS_BUCKET= wercker build --direct-mount

Note the 'X_' prefix. Wercker will remove this prefix inside the env. It
should also be noted that the 'X_' prefix is not used when setting env vars
in the wercker UI."

export GIT_COMMIT=$(echo $WERCKER_GIT_COMMIT | grep -o '.......$')
export ISO_8601_DATE=$(date -u +"%Y-%m-%dT%H%M%SZ") # UTC

# Note, the date changes each time the script runs. Sounds dumb but easy to miss.
export BUILD_NAME=${ISO_8601_DATE}_${WERCKER_GIT_BRANCH}_${GIT_COMMIT}
export BUILD_DIR=ci-build
export S3_TARGET=s3://$AWS_BUCKET/ci/$WERCKER_GIT_BRANCH

run_all() {
  tests
  compile
  archive
  upload
}

tests() {
  echo ""
  echo "Tests..."

  go test -timeout=60s ./...

  echo "Complete"
}

compile() {
  echo ""
  echo "Compile binaries..."

  mkdir -p $BUILD_DIR
  echo "$BUILD_DIR/backplane-site.go"
  go build -o $BUILD_DIR/backplane-site.go cmd/backplane-site/backplane-site.go
  echo "$BUILD_DIR/backplane-site-run.go"
  go build -o $BUILD_DIR/backplane-site-run.go cmd/backplane-site/run.go
  echo "$BUILD_DIR/backplane-edge.go"
  go build -o $BUILD_DIR/backplane-edge.go cmd/backplane-edge/backplane-edge.go

  echo "Complete"
}

archive() {
  echo ""
  echo "Archive binaries..."

  echo "$BUILD_DIR/* -> $BUILD_NAME.tgz"
  tar -zcf $BUILD_NAME.tgz -C $BUILD_DIR .

  echo "Complete"
}

upload() {
  echo ""
  echo "Upload archive..."

  # If we want to run these functions separately, timestamp filenames hose us :)
  # list the archives, grab the first one, then snag just it's filename
  export ARCHIVE=$(ls -la *.tgz | head -n 1 | awk '{print $NF}')
  config_aws && aws s3 cp $ARCHIVE $S3_TARGET/$BUILD_NAME.tgz

  echo "Complete"
}

config_aws() {
  aws configure set aws_access_key_id $AWS_KEY
  aws configure set aws_secret_access_key $AWS_SECRET
  aws configure set default.region $AWS_REGION
}

# Help
if [ "$1" == "-h" ]; then
  echo "$usage"
  exit 0
fi

# Help: wercker
if [ "$1" == "-w" ]; then
  echo "$wercker"
  exit 0
fi

# No args, runs all steps
if [ $# -eq 0 ]; then
  run_all
fi

# Pass arguments as function calls (see run_ci)
# This allows us to run each step on it's own
for var in "$@"
do
  $var
done

