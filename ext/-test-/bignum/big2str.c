#include "ruby.h"
#include "internal.h"

static VALUE
big(VALUE x)
{
    if (FIXNUM_P(x))
        return rb_int2big(FIX2LONG(x));
    if (RB_TYPE_P(x, T_BIGNUM))
        return x;
    rb_raise(rb_eTypeError, "can't convert %s to Bignum",
            rb_obj_classname(x));
}

static VALUE
big2str_generic(VALUE x, VALUE vbase)
{
    int base = NUM2INT(vbase);
    if (base < 2 || 36 < base)
        rb_raise(rb_eArgError, "invalid radix %d", base);
    return rb_big2str_generic(big(x), NUM2INT(vbase));
}

#define POW2_P(x) (((x)&((x)-1))==0)

static VALUE
big2str_poweroftwo(VALUE x, VALUE vbase)
{
    int base = NUM2INT(vbase);
    if (base < 2 || 36 < base || !POW2_P(base))
        rb_raise(rb_eArgError, "invalid radix %d", base);
    return rb_big2str_poweroftwo(big(x), NUM2INT(vbase));
}

void
Init_big2str(VALUE klass)
{
    rb_define_method(rb_cInteger, "big2str_generic", big2str_generic, 1);
    rb_define_method(rb_cInteger, "big2str_poweroftwo", big2str_poweroftwo, 1);
}
