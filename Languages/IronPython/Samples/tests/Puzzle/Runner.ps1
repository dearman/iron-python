#####################################################################################
#
#  Copyright (c) Microsoft Corporation. All rights reserved.
#
# This source code is subject to terms and conditions of the Apache License, Version 2.0. A 
# copy of the license can be found in the License.html file at the root of this distribution. If 
# you cannot locate the  Apache License, Version 2.0, please send an email to 
# ironpy@microsoft.com. By using this source code in any fashion, you are agreeing to be bound 
# by the terms of the Apache License, Version 2.0.
#
# You must not remove this notice, or any other, from this software.
#
#
#####################################################################################

#------------------------------------------------------------------------------
$CURRPATH = split-path -parent $MyInvocation.MyCommand.Definition
. $CURRPATH\..\Common.ps1
if (! $?) {
    exit 1
}

#------------------------------------------------------------------------------
setup-sampletests $CURRPATH\..\..\Puzzle
sanitycheck-sample

#------------------------------------------------------------------------------
echo "Now running automated tests..."
.\TestPuzzle.exe $env:IPY_CMD
if (! $?) {
    echo "TestPuzzle.exe failed!"
    exit 1
}
else {
    echo "Finished!"
}

#------------------------------------------------------------------------------
takedown-sampletests $CURRPATH\..\..\Puzzle
rm -force $CURRPATH\..\..\Puzzle\cache\*.jpeg