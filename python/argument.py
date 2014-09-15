def foo(name, *arg, **keyarg):
    print(name)
    for n in arg:
        print 'arg', n

    for k in keyarg:
        print 'keyarg', k,keyarg[k]

