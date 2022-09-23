# 编译原理

2019 - 2020 春 鲁东明

- 实际上大部分课程内容是去旁听其他老师的；
- 由于疫情原因是线上考试，比较水

## 编译原理的课程作业

- project
    - 用c语言在600行以内实现的简单的解释器：[tryC](https://github.com/yunwei37/tryC)
    - 编译原理大作业

- report 编译过程中的并行性优化概述

- lab assignments

    - lab1：
        
        编写一个 LEX 输入文件,使之生成可计算文本文件的字符、单词和行数且能报告这些数字的程序。单词为不带标点或空格的字母和/数字的序列。标点和空白格不计算为单词。

    - lab2:

        编写一个 LEX 输入文件,使之可生成将程序(语言事先定义)注释之外的所有关键字(保留字)均大写的程序。该 LEX 生成的程序要能够对源程序进行分析,将不是大写的关键字均转换为大写。

    - lab3:

        生成如下文法表示的表达式对应的计算器

             exp->exp + exp | exp – exp
            | exp * exp |exp / exp
            |exp ^ exp | - exp
            |(exp) |NUM

        对于输入的中缀表达式,要给出结果。如 3 +(4 * 5)结果应为 23。要求能连续处理若干个数学表达式,直到输入结束或文件结束。

    - lab4:

        要求同lab3，但要求能同时处理浮点数值和整数
# Compiler-Principle-Labs
