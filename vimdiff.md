# vimdiff 

## Pane layout

ours/local | original/base | theirs/remote
------------------------------------------
             merge / final

## Navigate changes

[c (next hunk)
]c (last hunk)

## Commands

diffo (diff off  - compress diffs)
difft (diff this - back to normal)

diff get 2 (inside done)
diffu (diff update - run after changes)

## Bring changes in

diffg LO
diffg RE
do        / diff obtain

## Put changes elsewehere

diffp lo
diffp re
dp        / diff put

## ABORT, NO CAN DO, I NEED AN ADULT

git reset --hard 
git merge --abort
git cherry-pick --abort

 - if you fuckup a merge, then you can redo and start over with the tool

