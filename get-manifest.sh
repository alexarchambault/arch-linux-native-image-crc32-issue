#!/usr/bin/env bash
set -e

unzip -p "$(cs get https://repo1.maven.org/maven2/org/scala-lang/scala-library/2.13.8/scala-library-2.13.8.jar)" META-INF/MANIFEST.MF > MANIFEST.MF
