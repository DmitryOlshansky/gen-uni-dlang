#!/bin/sh
PREFIX="http://www.unicode.org/Public/UNIDATA/"
FILES="CaseFolding.txt Blocks.txt PropList.txt DerivedCoreProperties.txt DerivedNormalizationProps.txt Scripts.txt HangulSyllableType.txt UnicodeData.txt CompositionExclusions.txt SpecialCasing.txt"
for NAME in $FILES
do
    wget -nc $PREFIX$NAME
done
