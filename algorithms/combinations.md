## Context&nbsp;[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fnumerica-ideas%2Fcommunity%2Ftree%2Fmaster%2Falgorithms%2Fletter-combinations-of-a-phone-number&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://numericaideas.com/)
This challenge comes from Leetcode, it's about finding all possible letter combinations that the provided number could represent on a cellular phone keyboard.

**Challenge**: https://leetcode.com/problems/combinations/description/.

**Solution**: 
The code provided below is a JavaScript implementation of the "combine" function, which generates all possible combinations of numbers from 1 to n with length k.

**Sample Code**:
```javascript
/**
 * @param {number} n
 * @param {number} k
 * @return {number[][]}
 */

var combine = function(n, k) {
  if (n < k || k < 1) return [];

  var result = [];

  x(result, [], 0, n, k);

  return result;
};

var x = function (result, y0, x0, n, k) {
  if (k === 0) {
    result.push(Array.from(y0));
    return;
  }

  for (var i = x0; i < n; i++) {
    y0.push(i + 1)
    x(result, y0, i + 1, n, k - 1);
    y0.pop();
  }
};
```

Runtime: 85 ms

By Noel Foka
