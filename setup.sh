if [ ${#} != 0 ] && [ ${#} != 1 ]; then
    echo "usage: ${0} [build]"
    return 1
fi

#
# Check for build directory
MYBUILD=build
if [ ! -d "${MYBUILD}" ]; then
    echo "Install directory ${MYBUILD} does not exist - creating it..."
    mkdir -p "${MYBUILD}" || { echo "Failed to create ${MYBUILD}"; exit 1; }
fi

#
# Check for install directory
MYINSTALL=install
if [ ! -d "${MYINSTALL}" ]; then
    echo "Install directory ${MYINSTALL} does not exist - creating it..."
    mkdir -p "${MYINSTALL}" || { echo "Failed to create ${MYINSTALL}"; exit 1; }
fi

# Convert to absolute path
export MYINSTALL=$(realpath ${MYINSTALL})

# Set paths
export PATH=${MYINSTALL}/bin:$PATH
export LD_LIBRARY_PATH=${MYINSTALL}/lib:${MYINSTALL}/lib64:$LD_LIBRARY_PATH
export ROOT_INCLUDE_PATH=${MYINSTALL}/include:$ROOT_INCLUDE_PATH
export PYTHONPATH=${MYINSTALL}/python:$PYTHONPATH
export CMAKE_PREFIX_PATH=${MYINSTALL}:$CMAKE_PREFIX_PATH

#
# Add new modules
#export MYWORKSPACE=$(realpath $(dirname ${BASH_SOURCE[0]}))
#for pkglib in $(find ${MYWORKSPACE}/packages -name '*.so' -type l -o -name '*.so' -type f)
#do
#    pkgname=$(basename ${pkglib})
#    if [[ "${MARLIN_DLL}" == *"${pkgname}"* ]]; then
#        MARLIN_DLL=$(echo ${MARLIN_DLL} | sed -e 's|[^:]\+'${pkgname}'|'${pkglib}'|')
#    else
#        MARLIN_DLL=${pkglib}:${MARLIN_DLL}
#    fi
#done
#export MARLIN_DLL
