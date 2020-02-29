divert(-1)

dnl cmp(int_to_compare, clause_if_under, clause_if_equal, clause_if_over)
dnl uses one byte to the right of cmp
define(cmp, {>zero()plus(1)<repeat_n({[-}, $1)
    [$3zero()>minus(1)<]
    >[<$4>minus(1)]<
repeat_n({]}, $1)
    >[<$2>minus(1)]<
})


divert(0)dnl
