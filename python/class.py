
class test:
    i = 0
    def set(self, arg):
        self.i = arg
            
    def get(self):
        return self.i

    def dump(self):
        print self.i

    def __init__(self, arg):
        self.i = arg    

if __name__ == '__main__':
    t = test(100)
    t.dump()
