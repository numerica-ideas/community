## Context&nbsp;[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fnumerica-ideas%2Fcommunity%2Ftree%2Fmaster%2Falgorithms%2Fremove-duplicate-lists&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://numericaideas.com/)
This challenge comes from Leetcode, It is an implementation of an algorithm that takes as input the head of a sorted linked list, removes all duplicate nodes from the list, and returns the sorted linked list without the duplicate nodes.

**Challenge**: https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/.

**Solution**:
The function below takes as input the head of a sorted linked list and returns the linked list with all duplicate nodes removed and sorted. The basic idea is to use two pointers, `previous` and `current`, to iterate through the list and identify duplicate nodes. We skip all duplicate nodes by moving `current` forward until it reaches a separate node. Then we link the `previous` node to the `current` node if there are no duplicates, or we skip all duplicate nodes if there are any. Finally, we return the new list head (after skipping the `dummy` node).

**Sample Code**:
```javascript
/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} head
 * @return {ListNode}
 */
var deleteDuplicates = function(head) {
    // Create a dummy node to serve as a head of the list
    const dummy = new ListNode(0);
    dummy.next = head;

    // Initialise the current and previous node
    let previous = dummy;
    let current = head;

    while (current !== null) {

        //skype all nodes with duplicates
        while (current.next !== null && current.val === current.next.val) {
            current = current.next;
        }

        // If there are no duplicates, link the previous node to the current node
        if (previous.next === current) {
            previous = previous.next;
        } else {
            previous.next = current.next;
        }

        // Move on to the next node
        current = current.next;
    }

    // Return the new head list
    return dummy.next
};
```

Runtime: 73ms

By [Noel Foka](https://github.com/noelfoka)
