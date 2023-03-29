## Context
This challenge comes from Leetcode, it's about finding the number of zero-filled subarrays from a provided array.

**Challenge**: https://leetcode.com/problems/number-of-zero-filled-subarrays/.

**Solution**: 
Our solution is quite simple, first we map the array, then count and store the number of occurrences and the number of previous direct neighbors for each zero.

**Sample Code**:
```javascript
function zeroFilledSubarray(nums: number[]) {
    let sum: number = 0;
    let acc: number = 0;

    nums.forEach((n) => {
        if(n == 0) {
            sum++;
            sum += acc;
            acc++;
            return;
        }
        acc = 0;
    });
    return sum;
};
```

By Ismael Messa
