# make grep use stadard regex notation
# grep on it's own is fairly basic. Make it behave as ADAM expects.

grep -E 'normal|regex'
egrep 'normal|regex'
ack 'normal|regex'


