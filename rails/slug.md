# Rails has #parameterize which does this for you, silly
```
2.3.3 :005 > "some String that Does 'Something!!!###@#1234'".parameterize
 => "some-string-that-does-something-1234"
```
