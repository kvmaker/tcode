class MyError(Exception):
    def __init__(self, a, b, c):
        self.message = a + b + c
        
    def __str__(self):
        return str(self.message)

def foo0():
    print("in foo0 begin")
    raise MyError("a", "b", "c")
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
    except MyError as e:
        print e
