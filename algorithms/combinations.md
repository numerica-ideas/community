## Context&nbsp;[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fnumerica-ideas%2Fcommunity%2Ftree%2Fmaster%2Falgorithms%2Fletter-combinations-of-a-phone-number&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://numericaideas.com/)
This challenge comes from Leetcode, it's about finding all possible letter combinations that the provided number could represent on a cellular phone keyboard.

**Challenge**: https://leetcode.com/problems/combinations/description/.

**Solution**: 
The code provided below is a JavaScript implementation of the "combine" function, which generates all possible combinations of numbers from `1` to `n` with length `k`.


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

  generateCombinations(result, [], 0, n, k);

  return result;
};

var generateCombinations = function (result, currentCombination, currentIndex, n, k) {
  if (k === 0) {
    result.push(Array.from(currentCombination));
    return;
  }

  for (var i = currentIndex; i < n; i++) {
    currentCombination.push(i + 1)
    generateCombinations(result, currentCombination, i + 1, n, k - 1);
    currentCombination.pop();
  }
};
```

Runtime: 85 ms

By [Noel Foka](https://github.com/noelfoka)
