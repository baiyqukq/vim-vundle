Vim Indenting C/C++ Code
========================
Vim provides some basic formatting commands.
A combination of these commands with the editing commands will make the programmer happy.

A list of basic text formatting commands in Vim:

* <big>=</big> is an operator that formats/indents text.
* <big>i{</big> is a text object that specifies the surrounding code block. It should be used together with <big>v</big>, <big>=</big>, etc.

Some basic but useful operation that are combination of the two basic ones above:

* <big>vi{</big> visually selects the inner code block around the cursor.
* <big>=i{</big> formats the code block.
* <big>=2i{</big> formats the current block and the block around it.
* <big>==</big> formats current line.

The method to format a block of C/C++ or Java code:

1. First, go to the start point of codes to be formatted, then press <big>v</big> to start selection.
2. Second, go to the end point.
3. Third, press <big>=</big> to format the codes that have been selected. All braces and indentations will be aligned.

A short way to format the whole buffer:

```vim
    gg=G
```
