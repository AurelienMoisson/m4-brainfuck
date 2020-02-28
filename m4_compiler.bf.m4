divert(-1)changequote({,})

define({repeat_n}, {ifelse($2, {0}, {}, {$1repeat_n($1, decr($2))})})

define(left, {repeat_n({<}, $1)})
define(right, {repeat_n({>}, $1)})
define(minus, {repeat_n({-}, $1)})
define(plus, {repeat_n({+}, $1)})

define({find_right}, {minus($2)[plus($2)right($1)minus($2)]plus($2)})
define({find_left}, {minus($2)[plus($2)left($1)minus($2)]plus($2)})

define(move_right_n, {[-right($1)+left($1)]})
define(move_left_n, {[-left($1)+right($1)]})

define(move_n_left_n, {repeat_n(move_left_n($2)>, $1)left($1) left($2)})
define(move_n_right_n, {repeat_n(move_right_n($2)>, $1)left($1) right($2)})

dnl uses one byte to the right of source
dnl ends on source
define(copy_right_n, {[->+right($1)+left($1)<]>move_left_n(1)<})

dnl uses one byte to the left of source
dnl ends on source
define(copy_left_n, {[-<+left($1)+right($1)>]<move_right_n(1)>})

define(copy_n_right_n, {right($1)repeat_n({<}copy_right_n($2), $1)})
define(copy_n_left_n, {repeat_n(copy_left_n($2){>}, $1)left($1)})

dnl uses one byte to the right
dnl contract: each clause always returns to starting position
define(if, {>[-]+<minus($1)[>-<
    $3
[-]]>[-<
    $2
>]<})

divert(0)dnl
right(3)
find_right(2,3)
if(2,right(1)left(1), right(2)left(2))
copy_right_n(3)
copy_left_n(2)
copy_n_left_n(2, 1)
move_n_right_n(2, 5)
