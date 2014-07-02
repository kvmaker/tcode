class Solution:
    # @return a float
    def findMedianSortedArrays(self, A, B):
        m = len(A)
        n = len(B)
        i = j = 0
        for count in range(m+n):
            if A[i] < B[j]:
                i++
            else:
                j++

if __name__ == "__main__":
    a=[0]
    b=[1]
    s = Solution()

    pritn s.findMedianSortedArrays(a,b)
