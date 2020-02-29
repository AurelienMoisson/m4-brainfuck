divert(0)dnl
until(10,{
    read_chr()
    copy_right_n(1)
    right(2)
    if(10, {
        right(2)zero()plus(50)write_chr()left(2)
    }, {
        right(2)zero()plus(51)write_chr()left(2)
    })
    left(2)
})
zero()
plus(10)
write_chr()
