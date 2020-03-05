divert(-1)

dnl cmp(int_to_compare, clause_if_under, clause_if_equal, clause_if_over)
dnl uses one byte to the right of cmp
define(cmp, {>zero()plus(1)<repeat_n({[-}, $1)
    [$4zero()>minus(1)<]
    >[<$3>minus(1)]<
repeat_n({]}, $1)
    >[<$2>minus(1)]<
})

dnl add_n(number_of_bytes, source_to_target, target_to_source)
define(add_n, {ifelse($1, {0}, {}, {until(0, {-$2+$3})<add_n(decr($1), {>$2<}, {>$3<})>})})

divert(0)dnl
