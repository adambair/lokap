# Split an array into equal-ish parts in horizontal order
list = 'abcdefghijklmnopqrstuvwxyz'.split('')
[left, right] = list.reduce ((previousValue,currentValue,index) -> previousValue[+(index % 2 == 1)].push currentValue; previousValue), [[],[]]
# [ [ 'a', 'c', 'e', 'g', 'i', 'k', 'm', 'o', 'q', 's', 'u', 'w', 'y' ],
#   [ 'b', 'd', 'f', 'h', 'j', 'l', 'n', 'p', 'r', 't', 'v', 'x', 'z' ] ]
