## Context&nbsp;[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fnumerica-ideas%2Fcommunity%2Ftree%2Fmaster%2Falgorithms%2FCombinations&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://numericaideas.com/)
This challenge comes from Leetcode, it's about implementation of the "combine" function, which generates all possible combinations of numbers from ``1`` to ``n`` with length ``k``.

**Challenge**: https://leetcode.com/problems/combinations/description/.

**Solution**:
The code provided below is a JavaScript implementation of the "combine" function, which return all possible combinations of `k` numbers chosen from the range `[1, n]` given two integers `n` and `k`, representing respectively the range of numbers and the length of the combinations.

The function first checks if the input is valid (`n` must be greater than or equal to `k`, and `k` must be greater than or equal to `1`). If the input is invalid, an empty array is returned.

Otherwise, the function initializes an empty array called ``result`` to store the combinations.

Then it calls the auxiliary function ``combination`` with the initial values for ``result``, an empty array ``currentCombination``, the starting index ``currentIndex`` (initialized to ``0``), ``n`` and ``k``.

The auxiliary function ``combination`` is a recursive function that generates combinations. It takes the same parameters as the main function.

If ``k`` is equal to ``0``, it means that a combination has been completed. In this case, the current combination (stored in ``currentCombination``) is added to the ``result`` array using ``Array.from()`` to create a copy of the combination.

Otherwise, the function iterates from `currentIndex` to `n` (inclusive) and adds each number to ``currentCombination``. Then it calls itself recursively with updated values for `currentCombination` (with the added number), ``currentIndex`` (incremented by ``1``), ``n``, and ``k-1``.

After the recursive call, the last number added to ``currentCombination`` is removed using the ``pop()`` method to go back and explore other combinations.

After all recursive calls are complete, the ``result`` array contains all generated combinations, which are then returned.

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

[By Noel Foka](https://github.com/noelfoka)
