class test:
    def __init__(self, arg):
        self.data = arg

    def data(self):
        return self.data

    def data(self, num):
        if not isinstance(num, int):
            raise KeyError("wrong type.")
        self.data = num

    def __repr__(self):
        return repr(self.data)

if __name__ == '__main__':
    t = test(100)
    print t
