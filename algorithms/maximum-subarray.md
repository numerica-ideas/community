## Context&nbsp;[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fnumerica-ideas%2Fcommunity%2Ftree%2Fmaster%2Falgorithms%2Fmaximum-subarray&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://numericaideas.com/)

Given an integer array nums, find the subarray
with the largest sum, and return its sum.

**Challenge**: https://leetcode.com/problems/maximum-subarray/.

**Solution (using TypeScript)**:
Initially we have 2 variables, the first `sum` to store the sum of subarray and `acc` to accumulate the sum of each elements in the given array. And in the case `acc` is upper than `sum`, `sum` takes its value.

**Sample Code**:

```javascript
function maxSubArray(nums: number[]) {
  let sum: number = nums[0];
  let acc: number = 0;

  nums.forEach((n: number) => {
    acc = acc + n;
    if (sum < acc) {
      sum = acc;
    }
    if (acc < 0) {
      acc = 0;
    }
  });

  return sum;
}
```

#### Runtime: 82 ms

By [Ismael Messa](https://github.com/messaismael)
