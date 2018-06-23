HW_SOURCE_FILE = 'hw04.py'

###############
#  Questions  #
###############

def intersection(st, ave):
    """Represent an intersection using the Cantor pairing function."""
    return (st+ave)*(st+ave+1)//2 + ave

def street(inter):
    return w(inter) - avenue(inter)

def avenue(inter):
    return inter - (w(inter) ** 2 + w(inter)) // 2

w = lambda z: int(((8*z+1)**0.5-1)/2)

def taxicab(a, b):
    """Return the taxicab distance between two intersections.

    >>> times_square = intersection(46, 7)
    >>> ess_a_bagel = intersection(51, 3)
    >>> taxicab(times_square, ess_a_bagel)
    9
    >>> taxicab(ess_a_bagel, times_square)
    9
    """
    c = street(a)-street(b)
    d = avenue(a)-avenue(b)
    return abs(c)+abs(d)

def squares(s):
    """Returns a new list containing square roots of the elements of the
    original list that are perfect squares.

    >>> seq = [8, 49, 8, 9, 2, 1, 100, 102]
    >>> squares(seq)
    [7, 3, 1, 10]
    >>> seq = [500, 30]
    >>> squares(seq)
    []
    """
    def sqrt(n):
        for i in range(2,50):
            if n == 1:
                return 1
            if n/i == i:
                return i
    def is_square(n):
        for i in range(2,50):
            if n == 1:
                return True
            if n/i == i:
                return True
    list = []
    for num in s:
        if is_square(num):
            list.append(sqrt(num))
    return list

def g(n):
    """Return the value of G(n), computed recursively.

    >>> g(1)
    1
    >>> g(2)
    2
    >>> g(3)
    3
    >>> g(4)
    10
    >>> g(5)
    22
    >>> from construct_check import check
    >>> check(HW_SOURCE_FILE, 'g', ['While', 'For'])
    True
    """
    if n <= 3:
        return n
    else:
        return 3*g(n-3) + 2*g(n-2) + 1 * g(n-1)

def g_iter(n):
    """Return the value of G(n), computed iteratively.

    >>> g_iter(1)
    1
    >>> g_iter(2)
    2
    >>> g_iter(3)
    3
    >>> g_iter(4)
    10
    >>> g_iter(5)
    22
    >>> from construct_check import check
    >>> check(HW_SOURCE_FILE, 'g_iter', ['Recursion'])
    True
    """
    if n <= 3:
        return n
    else:
        dict = {}
        for i in range(1,n+1):
            if i <= 3:
                dict[i] = i
            else:
                dict[i] = dict[i-1] + 2 * dict[i-2] + 3 * dict[i-3]
    return dict[n]

def pingpong(n):
    """Return the nth element of the ping-pong sequence.

    >>> pingpong(7)
    7
    >>> pingpong(8)
    6
    >>> pingpong(15)
    1
    >>> pingpong(21)
    -1
    >>> pingpong(22)
    0
    >>> pingpong(30)
    6
    >>> pingpong(68)
    2
    >>> pingpong(69)
    1
    >>> pingpong(70)
    0
    >>> pingpong(71)
    1
    >>> pingpong(72)
    0
    >>> pingpong(100)
    2
    >>> from construct_check import check
    >>> check(HW_SOURCE_FILE, 'pingpong', ['Assign', 'AugAssign'])
    True
    """
    def negative(number):
        return number - 1

    def positive(number): 
        return number + 1

    def tracker(index, number, f, g):
        if index == 0:
            return tracker(index+1, f(number), f, g)
        elif index == n:
            return number
        elif has_seven(index) or index % 7 == 0:
            return tracker(index+1, g(number), g, f)
        else:
            return tracker(index+1, f(number), f, g)

    return tracker(0, 0, positive, negative)

    """
    Iterative Version:

    def counter(pred, num):
        if pred:
            num += 1
        else:
            num -= 1
        return num

    number = 0
    predicate = True
    for k in range(1,n+1):
        number = counter(predicate, number)
        if has_seven(k) or k%7 == 0:
            predicate = not predicate
    return number
    """



def has_seven(k):
    """Returns True if at least one of the digits of k is a 7, False otherwise.

    >>> has_seven(3)
    False
    >>> has_seven(7)
    True
    >>> has_seven(2734)
    True
    >>> has_seven(2634)
    False
    >>> has_seven(734)
    True
    >>> has_seven(7777)
    True
    """
    if k % 10 == 7:
        return True
    elif k < 10:
        return False
    else:
        return has_seven(k // 10)

def count_change(amount):
    """Return the number of ways to make change for amount.

    >>> count_change(7)
    6
    >>> count_change(10)
    14
    >>> count_change(20)
    60
    >>> count_change(100)
    9828
    """
    list = []
    number_of_ways = 0
    for i in range(1,amount):
        if i == 1:
            list.append(i)
            list.append(2**i)
        elif 2**i < amount:
            list.append(2**i)
    def count_change_coins(amount, lst):
        if amount < 0 or lst == []:
            return 0
        elif amount == 0:
            return 1
        else:
            return count_change_coins(amount, lst[1:]) + count_change_coins(amount-lst[0], lst)
    return count_change_coins(amount, list)

###################
# Extra Questions #
###################

from operator import sub, mul

def make_anonymous_factorial():
    """Return the value of an expression that computes factorial.

    >>> make_anonymous_factorial()(5)
    120
    >>> from construct_check import check
    >>> check(HW_SOURCE_FILE, 'make_anonymous_factorial', ['Assign', 'AugAssign', 'FunctionDef', 'Recursion'])
    True
    """
    return 'YOUR_EXPRESSION_HERE'
