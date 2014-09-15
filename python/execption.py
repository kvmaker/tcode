
def foo0():
    print("in foo0 begin")
    raise NameError("foo0")
    print("in foo0 end")

def foo1():
    print("in foo1 begin")
    foo0()
    print("in foo1 end")

def foo2():
    print("in foo2 begin")
    foo1()
    print("in foo2 end")
    
if __name__ == "__main__":
    try:
        foo2()
    except NameError:
        print("Name Error")
