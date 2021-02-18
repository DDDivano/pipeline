export PATH=/Library/Frameworks/Python.framework/Versions/3.6/bin:$PATH

export FLAGS_call_stack_level=2
export PYTHONPATH=`pwd`:$PYTHONPATH
cd task
cases=`find ./nn-test -name "test*.py" | sort`
ignore="test_randint.py \
test_randperm.py \
test_lstm_cudnn.py \
test_conv1d.py \
test_truncatedNormalInitializer.py \
"
for file in ${cases}
do
    echo ${file}
    if [[ ${ignore} =~ ${file##*/} ]]; then

        echo "跳过"

    else

        python -m pytest ${file} --alluredir=report

    fi
done

