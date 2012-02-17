SRC_DIR = source
BUILD_DIR = build
UGLIFY = uglifyjs --unsafe -nc
FOUNDRY_DIR = ../..
PRODUCTION_DIR = ${FOUNDRY_DIR}/scripts
DEVELOPMENT_DIR = ${FOUNDRY_DIR}/scripts_
MODULARIZE = ${FOUNDRY_DIR}/build/modularize
BASE_FILES = ${SRC_DIR}/jquery.checked.js

all: premake body min foundry

premake:
	mkdir -p ${BUILD_DIR}

body:
	@@cat ${BASE_FILES} > ${BUILD_DIR}/jquery.checked.js

min:
	${UGLIFY} ${BUILD_DIR}/jquery.checked.js > ${BUILD_DIR}/jquery.checked.min.js

foundry:
	${MODULARIZE} -n "checked" ${BUILD_DIR}/jquery.checked.js > ${DEVELOPMENT_DIR}/checked.js
	${UGLIFY} ${DEVELOPMENT_DIR}/checked.js > ${PRODUCTION_DIR}/checked.js




