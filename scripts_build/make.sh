#!/bin/sh -e

export VERSION=5.2

# Separate version-subversion by '_'
# E.g.: '4_1' (instead of '4.1')
export VERSION_UND=`echo $VERSION | tr '.' '_'`

#---
# Build SnpEff
#---

cd /code/SnpEff/

mvn clean compile assembly:single jar:jar

cp target/SnpEff-$VERSION-jar-with-dependencies.jar /code/SnpEff/snpEff.jar

# Install JAR file in local Maven repo
mvn install:install-file \
	-Dfile=target/SnpEff-$VERSION.jar \
	-DgroupId=org.snpeff \
	-DartifactId=SnpEff \
	-Dversion=$VERSION \
	-Dpackaging=jar \
	-DgeneratePom=true \
	--quiet

cd - 


echo "Build done!"
