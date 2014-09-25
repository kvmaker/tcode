import Debug.Trace

vadd :: Num a => [a] -> [a] -> [a]
vadd [] _ = []
vadd _ [] = []
vadd (x:xs) (y:ys) = x + y : vadd xs ys

vdel :: Num a => [a] -> [a] -> [a]
vdel [] _ = []
vdel _ [] = []
vdel (x:xs) (y:ys) = x - y : vdel xs ys

vdoc :: Num a => a -> [a] -> [a]
vdoc a [] = []
vdoc a (x:xs) = a * x : vdoc a xs

debug = flip trace
vmax :: Ord a => Show a => [a] -> a
vmax [] = error "empty list"
vmax [x]  = x `debug` (show x)
vmax all@(x:xs) = max x (vmax xs) `debug` (show all)
