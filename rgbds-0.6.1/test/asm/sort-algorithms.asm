MACRO sort_recursive
    if _NARG > 0
        def min_i = 1
        for i, 2, _NARG + 1
            if \<i> < \<min_i>
                def min_i = i
            endc
        endr
        print strfmt("%d", \<min_i>)
    endc
    if _NARG > 1
        print ", "
        redef _subsort equs "sort_recursive "
        for i, 1, _NARG + 1
            if i != min_i
                redef _subsort equs "{_subsort}\<i>,"
            endc
        endr
        {_subsort}
    else
        println
    endc
ENDM

MACRO sort_iterative
    for i, 1, _NARG + 1
        def got_{d:i} = 0
    endr
    for n, 1, _NARG + 1
        def min_i = 1
        for i, 2, _NARG + 1
            if (\<i> < \<min_i> && !got_{d:i}) || got_{d:min_i}
                def min_i = i
            endc
        endr
        def got_{d:min_i} = 1
        print strfmt("%d", \<min_i>)
        if n < _NARG
            print ", "
        else
            println
        endc
    endr
ENDM

    sort_recursive 16, 0, 16, 5, 1, 18, 3, 14, 19, 4, 6, 13, 17, 7, 11, 8, 15, 10, 12, 9, 2
    sort_iterative 16, 0, 16, 5, 1, 18, 3, 14, 19, 4, 6, 13, 17, 7, 11, 8, 15, 10, 12, 9, 2
