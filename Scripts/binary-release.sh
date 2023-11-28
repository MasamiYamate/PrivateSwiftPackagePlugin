WORK_DIR_PATH=$1

cd $WORK_DIR_PATH
DIFF_EXIT_CODE=`git diff –exit-code`
echo $DIFF_EXIT_CODE
