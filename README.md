《中国植物名录数据库》数据的来源与校对要点
-------------------------
## 数据说明
本说明主要是介绍 plantlist程序包的 cnplants 数据的来源与使用注意事项。原始数据以xlsx格式保存，可在 [https://github.com/helixcn/plantlist_data](https://github.com/helixcn/plantlist_data) 下载。

该数据库整合了多个数据库，相应数据内容归原作者所有，在使用时请引用相应的文献。

下面是数据库的结构：2017-11-10的版本，共包含12个列，51751行。

各列分别为：

1. SPECIES_CN 物种中文名： 主要参考《中国植物志》物种名录 [http://frps.eflora.cn/](http://frps.eflora.cn/)

2. SPECIES 物种学名： 主要参考 《中国植物志》物种名录 [http://frps.eflora.cn/](http://frps.eflora.cn/)

3. SPECIES_FULL 带命名人的学名： 主要参考 《中国植物志》物种名录 [http://frps.eflora.cn/](http://frps.eflora.cn/)

4. GENUS 属： 属名是从学名中提取的

5. GENUS_CN: 中文属名： 被子植物主要参考刘冰等2015的论文， 其余类群均参考多识百科网站[http://duocet.ibiodiversity.net/](http://duocet.ibiodiversity.net/)

6. FAMILY_APGIII科名：

    a.被子植物参照APGIII 分类系统[http://www.theplantlist.org/1.1/browse/-/-/](http://www.theplantlist.org/1.1/browse/-/-/)；

    b.裸子植物参照 Christenhusz et al, 2011a；

    c.蕨类植物参考 Christenhusz et al, 2011b；

    d.苔藓植物参考 The Plant List 网站 [http://www.theplantlist.org/1.1/browse/-/-/](http://www.theplantlist.org/1.1/browse/-/-/)

7. FAMILY_CN 中文科名：被子植物主要参考刘冰等2015的论文， 其余类群均参考多识百科网站[http://duocet.ibiodiversity.net/](http://duocet.ibiodiversity.net/)

8. GROUP 所属类群：即苔藓、蕨类、裸子植物、被子植物

9. IUCN_CHINA 中国物种IUCN红色名录的濒危等级： 主要参考 《中国生物多样性红色名录——高等植物卷 》

10. ENDEMIC_TO_CHINA 是否为中国特有种： 主要参考《中国生物多样性红色名录——高等植物卷 》

11. PROVINTIAL_DISTRIBUTION    省级分布： 主要参考（中国数字植物标本馆 CVH植物名称及分布数据库 34056条记录版本, 该数据现已不能访问）

12. ALTITUDE 海拔分布范围： 主要参考（中国数字植物标本馆 CVH植物名称及分布数据库 34056条记录版本, 该数据现已不能访问）

不同数据库在处理过程中，分别使用中文名或者学名合并，不过一些物种学名中有拼写错误，中文名有错别字，还有部分种是同物异名或者同名异物，因此，在使用时应该十分小心。用CTPL2函数基于此数据生成的物种名录，应该严格校对， 风险应自行承担。

我们正在邀请志愿者对本数据进行进一步校对，如果您对校对该数据库有兴趣，请联系 jinlongzhang01@gmail.com， 我会考虑把您作为程序包的共同作者。

## 校对要点：

1. 如果学名是重复的，则Excel会用红色自动标注。如果学名出现重复，最主要的原因是不同数据库的中文名不一致，这是由于在准备本表格的过程中，各条目主要是按照学名匹配的。例如 IUCN_CHINA和ENDEMIC_TO_CHINA 两列主要来源于《中国物种红色名录》，而该名录中物种的中文名错误较多，所以一般情况下这条应该删除。该条对应的IUCN_CHINA， ENDEMIC_TO_CHINA的状态（例如 无危（LC），以及是否中国特有） 应该移动到学名相同的另一条的对应位置。注意：删除一条记录时，必须整条删除，可以在最左侧点击行号，全选一行后，按DEL键删除整行内容，切勿使用鼠标右键>删除单元格，因为后者容易导致串行，损坏整个数据库。

2. 物种中文名的错别字，需要一并检查。对于出现的繁体字、异体字应该替换成简体字，并尽量遵从《中国植物志》的写法。学名以及命名人缩写应该尽量与《中国植物志》[http://frps.eflora.cn/](http://frps.eflora.cn/) 为准。改正后，如果中文名有重复，只能保留最常用的一条中文名。

3. 对于没有完整学名的物种(即SPECIES_FULL 为空)， 要在《中国植物志》 [http://frps.eflora.cn/](http://frps.eflora.cn/) 先查询完整的学名。

4. 黄色高亮部分为需要商议后采取措施的。需要逐条改正。如果是中文科名，则应该从GENUS一列删除。

5. GROUP, IUCN_CHINA, ENDEMIC_TO_CHINA, PROVINTIAL_DISTRIBUTION, ALTITUDE 等几项， 如果没有数据，不必再补充。

## 参考文献：

* 多识团队. (2016至今). 多识植物百科. [http://doucet.ibiodiversity.net/](http://doucet.ibiodiversity.net/).

* 刘冰, 叶建飞, 刘夙, 汪远, 杨永, 赖阳均, 曾刚，林秦文. (2015). 中国被子植物科属概览: 依据 APG III 系统. 生物多样性, 23(2), 225-231.

* 中华人民共和国生态环境部、中国科学院公告 (2013) 《中国生物多样性红色名录-高等植物卷》http://www.mee.gov.cn/gkml/hbb/bgg/201309/t20130912_260061.htm

* Christenhusz, M., Zhang, X. C., and Schneider, H. (2011a). A linear sequence of extant families and genera of lycophytes and ferns. Phytotaxa. 19:7-54

* Christenhusz, M., Reveal, J., Farjon, A., Gardner, M. F., Mill, R. R., and Chase, M. W. (2011b). A new classification and linear sequence of extant gymnosperms. Phytotaxa. 19:55-70
