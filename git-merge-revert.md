
git show <merge-commit>

look for `Merge: <parent1> <parent2>

usually you want parent1
to double check run:

`git show <parent1>` or `git show <parent2>` to see which you want to revert

commit: 931bab55a3e8312a3da13b10a2ac34399ff6fe51
merge:  6b6c6edc6 9c275959b
parent: 6b6c6edc6

to run the revert:

`git revert -m1 <merge-commit>`

where m1 or m2 is the merge parents (respectively)
