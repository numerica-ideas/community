## Context&nbsp;[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fnumerica-ideas%2Fcommunity%2Ftree%2Fmaster%2Falgorithms%2Fnumber-of-zero-filled-subarrays&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://numericaideas.com/)
This challenge comes from Leetcode, it's about finding the number of zero-filled subarrays from a provided array.

**Challenge**: https://leetcode.com/problems/number-of-zero-filled-subarrays/.

**Solution**: 
Our solution is quite simple, first we map the array, then count and store the number of occurrences and the number of previous direct neighbors for each zero.

**Sample Code**:
```javascript
/**
 * Finding the number of zero-filled subarrays from a provided array.
 * See {@link https://leetcode.com/problems/number-of-zero-filled-subarrays}.
 * 
 * @param nums An array of integers.
 */
function zeroFilledSubarray(nums: number[]): number {
    let sum: number = 0;
    let acc: number = 0;

    nums.forEach((n) => {
        if (n == 0) {
            sum++;
            sum += acc;
            acc++;
            return;
        }
        acc = 0;
    });
    return sum;
}
```

By [Ismael Messa](https://github.com/messaismael)
