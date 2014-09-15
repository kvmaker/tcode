class test(object):
    def __init__(self, arg):
        self._data = arg

    @property
    def data(self):
        print 'data property'
        return self._data

    @data.setter
    def data(self, value):
        print 'data.setter'
        if not isinstance(value, int):
            raise KeyError("wrong type.")
        self._data = value

    @data.deleter
    def data(self):
        del self._data

    def __repr__(self):
        return repr(self._data)


if __name__ == '__main__':
    t = test(100)
    print t.data
    t.data = 200
    print t.data
