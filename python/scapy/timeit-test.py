#! /usr/bin/env python

import timeit
from timeit import Timer, timeit, repeat

lst = range(100)

def f1(lst):
    out = []
    for item in lst:
        out.append(lst[lst.index(item)])
    return out
            
def f2(lst):
    return [item for item in lst]
    
def test():
    c=0
    for i in range(100):
        c=i-c
    return c
                    
print(test())

print(__name__)
TimeIt = timeit("test()", setup="from __main__ import test", number=100000)
Repeat = repeat("test()", setup="from __main__ import test", repeat=3, number=100000)
print(TimeIt)
print(Repeat, min(Repeat))

               
# %timeit f1(lst)
               
# %timeit f2(lst)

