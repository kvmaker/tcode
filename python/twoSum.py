class Solution:
    # @return a tuple, (index1, index2)
    def twoSum(self, num, target):
        dict={}
        for i in range(len(num)):
            a = num[i]
            if target - a in dict:
                return dict[target - a] + 1,i + 1
            else:
                dict[a] = i

        return -1,-1

if __name__ == '__main__':
    a=[x*2 for x in range(100000)]
    s = Solution()
    print s.twoSum(a, 130000)
    a = [0,4,3,0]
    print s.twoSum(a, 0)
