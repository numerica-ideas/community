## Context&nbsp;[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fnumerica-ideas%2Fcommunity%2Ftree%2Fmaster%2Falgorithms%2Fletter-combinations-phone-number&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://numericaideas.com/)
This challenge comes from Leetcode, it's about finding the number of zero-filled subarrays from a provided array.

**Challenge**: https://leetcode.com/problems/letter-combinations-of-a-phone-number/.

**Solution**: 
Our solution is quite simple, first we map the array, then count and store the number of occurrences and the number of previous direct neighbors for each zero.

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


    function combinaison(numeroEntree: string, listCombPrec:    string[]) {
        let accComb: string =[];
        for(let combprec of listCombPrec) {
            for(combSuiv of list[numeroEntree[0]]) {
                accComb.push(combPrec.concat(combSuiv));
            }
        }
        return numeroEntree.length > 1 ?combinaison(numeroEntree.substring(1), accComb) : accComb;
    }
    return !digits.length? [] : combinaison(digits, ['']);
};
```

By Noel Foka
