vadd :: (Num a) => [a] -> [a] -> [a]
vadd [] _ = []
vadd _ [] = []
vadd (x:xs) (y:ys) = x + y : vadd xs ys
