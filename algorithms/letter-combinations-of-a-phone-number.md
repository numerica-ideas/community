## Context&nbsp;[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fnumerica-ideas%2Fcommunity%2Ftree%2Fmaster%2Falgorithms%2Fletter-combinations-of-a-phone-number.md&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://numericaideas.com/)
This challenge comes from Leetcode, it's about finding all possible letter combinations that the provided number could represent on a cellular phone keyboard.

**Challenge**: https://leetcode.com/problems/letter-combinations-of-a-phone-number/.

**Solution**: 
The solution is simple, we have assigned to each number, a table containing corresponding letters. And then we used recursion to return all possible combinations of letters that the number can represent.

**Sample Code**:
```javascript
function letterCombination(digits: string): string[] {
  let list = {
    2: ['a', 'b', 'c'],
    3: ['d', 'e', 'f'],
    4: ['g', 'h', 'i'],
    5: ['j', 'k', 'l'],
    6: ['m', 'n', 'o'],
    7: ['p', 'q', 'r', 's'],
    8: ['t', 'u', 'v'],
    9: ['w', 'x', 'y', 'z']
  }
  
  function combinaison(numeroEntree: string, listCombPrec: string) {
    let accComb: string[] = [];
    for(let combPrec of listComprec) {
      for(let combSuiv of list[numeroEntree[0]]) {
        accComb.push(combPrec.concat(combSuiv));
      }
    }
    return numeroEntree.length > 1 ?combinaison(numeroentree.substring(1), accComb) :accComb;
  }
  return !digits.length ? [] : combinaison(digits, ['']);
};
```

By Noel Foka
