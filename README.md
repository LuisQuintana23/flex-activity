# Flex activity

## Basic use

Generate .c file

```sh
flex lexical.l
```

Compile `lex.yy.c`

```sh
gcc lex.yy.c -o lexical
```

Run the generated binary

Linux

```sh
./lexical test.txt
```