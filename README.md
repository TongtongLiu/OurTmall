# OurTmall -- By Xinyi Zhao, Yu Bao & Tongtong Liu

## 文件结构

OurTmall
|
| - Develop
|
| - Submit
|
| - Appendix
|
| - README.md

* Develop为开发部分，是主要的工作区域
* Submit为提交部分，是作业提交的整理区域。Submit下设了Earlier, Medium, Later, Presentation和Final，分别表示前期、中期、后期、答辩和最终版。
* Appendix为附件部分，用于分享相关资料
* README.md为说明文件

## 开发规范

1. 命名规范
	* 文件：所有单词开头字母大写，例如HellpWorld.cs，特殊文件请用前缀说明用途，例如SQL文件以"DB_"为前缀
	* 类：名词短语，所有单词开头字母大写，例如public class BookManage
	* 函数：动词短语，第一个单词全部小写，后面的单词开头字母大写，全局操作以"gb_"开头，类的成员方法以"mb_"开头，例如某全局函数为gb_getInteger()，某类的某成员方法为mb_printInfo()
	* 变量：名词或名词短语，若为单词则全部小写，若为词组则每个单词开头字母大写，常量全部字母大写
2. Commit Message规范
	* "自己的姓名首字母开头"+": "+"修改内容"，例如LTT: 修复数据库某bug
3. 其他
	* Tab键 = 4个空格
	* 变量声明位于作用域(类的内部或者函数的内部)的开头，以空行与后面的语句分开

## 想法区 

### ZXY



### BY



### TT

多使用分支(branch)功能。每个功能的开发在自己的branch内进行，开发完毕并测试正确后在合并(merge)到主分支。