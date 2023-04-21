## Context&nbsp;[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fnumerica-ideas%2Fcommunity%2Ftree%2Fmaster%2Falgorithms%2Fletter-combinations-phone-number&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://numericaideas.com/)
Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.

**Challenge**: https://leetcode.com/problems/letter-combinations-of-a-phone-number/.

**Solution 1 (using TypeScript)**: 
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


    function combinaison(numeroEntree: string, listCombPrec: string[]) {
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
#### Runtime: 45ms
By [Noel Foka](https://github.com/noelfoka)

------------------

**Solution 2 (using Python 3)**: 
Our solution is quite simple. First, we validate user's input and display appropriate error messages in case there is any error.
Next, we create an empty list that will serve as an accumulator and another list for matches containing strings whose values are the equivalent
of each character in the input digit.
Finally, we launch a loop and make use of the matches list and the accumulator while calling the function 
```buildCombinations(self, current: list[str], next: list[str]) -> list[str]```
to build letters combinations whose result will be set into the accumulator

**Sample Code**:
```python
class Solution:
    def buildCombinations(self, current: list[str], next: list[str]) -> list[str]:
        if len(current) == 0: return next
        acc = []
        for i in current:
            for j in next:
                acc.append(i+j)
        return acc
    
    def letterCombinations(self, digits: str) -> list[str]:
        data = {"2": "abc", "3": "def", "4": "ghi", "5": "jkl", "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"}
        combinations = []
        
        if len(digits) == 0:
            return combinations
        
        if len(digits) > 4:
            raise "The maximum number of digits must be 4"
        
        if digits.isdigit():
            if "0" in digits or "1" in digits:
                raise "Valid digits must be in the range [2-9]"
        else: raise "Non-digits values are not allowed"
            
        matches = [data[digit] for digit in digits]
        
        for match in matches:
            combinations = self.buildCombinations(combinations, list(match))
        
        return combinations
```
#### Runtime: 38ms
By [Yvan Tcheuffa](https://github.com/yvantcheuffa)
