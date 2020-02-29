for filename in test_scripts/*
do
    test_name=$(basename $filename .bf.m4)
    m4 ../src/macros/* $filename > bf_output/$test_name.bf
    bfc bf_output/$test_name.bf
    ./a.out < test_inputs/$test_name.in > test_output/$test_name.out
    if diff test_output/$test_name.out expected_output/$test_name.out
    then
        echo -e "$test_name \033[32msuccess\033[0m"
    else
        echo -e "$test_name \033[31mfailed\033[0m"
    fi
done
