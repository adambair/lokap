# diagnose vim performance issues

This does not apply to startup, this is mainly for interactions

## syntax highlighting

syntime on
syntime off
syntime report

## scrolling profiling

profile start profile.log
profile file *
profile func * 
profile pause

review profile.log
