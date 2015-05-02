#!/usr/bin/python

from math import *

def floatToString(n):
    if n < 0:
        sign = -1
    else:
        sign = 1
    
    n *= sign

    intpart = int(floor(n))
    fltpart = n - intpart

    if intpart == 0 and fltpart == 0:
        return '0'
    else:
        if sign == 1:
            ret = '+'
        else:
            ret = '-'

    if intpart != 0:
        ret += str(intpart) + ' '
      
    if fltpart > 0.6:
        ret += '2/3'
    elif fltpart > 0.3:
        ret += '1/3'

    return ret

print floatToString(0.3333333333)
print floatToString(0.6666666666)
print floatToString(0)
print floatToString(-0.3333333333)
print floatToString(-1.3333333333)
print floatToString(2.3333333333)

