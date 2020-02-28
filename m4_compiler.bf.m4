divert(-1)changequote({,})

define({copy_n}, {ifelse($2, {0}, {}, {$1copy_n($1, decr($2))})})

define({find_right}, {copy_n({-}, $2)[copy_n({+}, $2)copy_n({>}, $1)copy_n({-}, $2)]copy_n({+}, $2)})
define({find_left}, {copy_n({-}, $2)[copy_n({+}, $2)copy_n({<}, $1)copy_n({-}, $2)]copy_n({+}, $2)})

define(left, {copy_n({<}, $1)})
define(right, {copy_n({>}, $1)})

define(move_right, {[-right($1)+left($1)]})
define(move_left, {[-left($1)+right($1)]})

dnl uses one byte to the right of source
dnl ends on source
define(copy_n_right, {[->+right($1)+left($1)<]>move_left(1)<})

dnl uses one byte to the left of source
dnl ends on source
define(copy_n_left, {[-<+left($1)+right($1)>]<move_right(1)>})

dnl uses one byte to the right
dnl contract: each clause always returns to starting position
define(if, {>[-]+<copy_n({-}, $1)[[-]>-<
    $3
]>[-<
    $2
>]<})

divert(0)dnl
right(3)
find_right(2,3)
if(2,right(1)left(1), right(2)left(2))
copy_n_right(3)
copy_n_left(2)
