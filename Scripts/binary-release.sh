BINARY_DIR_PATH="./XCFramework"
WORK_DIR_PATH=$1

cd $WORK_DIR_PATH


mkdir hogehoge

# Binary directly check
if [ ! -e $BINARY_DIR_PATH ]; then
    exit 1
fi

git pull

mkdir hogehoge

# Git diff check
git diff –exit-code
DIFF_EXIT_CODE=`echo $?`
if [ $DIFF_EXIT_CODE -ne 0 ]; then
    exit 1
fi




echo $DIFF_EXIT_CODE
