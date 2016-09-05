# LZBTableViewBottomScollEffect
####tabView滚动的底部效果，比如上拉放大
demo技术点：下拉放大、下拉回弹、上拉放大、上拉回弹效果、自定义tableView的dataSouce等

上拉回弹：
核心思想：改变最后一个cell的y值和高度

步骤：
1.计算刚好拖到底部时候的offset

刚好拖动到底部的距离 = scrollView.contentSize.height - scrollView.frame.size.height

要是在向上拖动一点点就会导致整个tableView被拖起来，所以偏移量 offset = scrollView.contentOffset.y -(scrollView.contentSize.height - scrollView.frame.size.height);

2、拿到之前在cellForRowAtIndexPath保存的最后一个cell
这个代码在cellForRowAtIndexPath

//保存最后一个cell和cell的y值   
/*if(sectionModel.tableViewRowArray.count-1  == indexPath.row)
{
self.lastCell = scaleCell;
}*/
3、计算变化的高度注意：

[LZBScaleTableViewCell getScaleTableViewCellHeight]是cell的固定高度

cellFrame.size.height = [LZBScaleTableViewCell getScaleTableViewCellHeight] + offset;

4.最后给cell赋值

cell.coverImageView.bounds = cellFrame;

cell.coverImageView.center = CGPointMake(cellFrame.size.width *0.5, cellFrame.size.height *0.5);

####自定义tableView的数据源

第一个问题我们可以采用自定义数据源类来优化。

分析：这个数据源应该需要传入什么参数？参数1：模型数组（一个模型包括，组头标题，组尾标题，每组的模型数组）

/*@interface LZBArrayDataSourceSectionObject :NSObject
@property (nonatomic, copy) NSString *headerTitle;  //头部标题
@property (nonatomic, copy) NSString *footerTilte; //底部标题
@property (nonatomic, strong) NSMutableArray *items; //每组模型数组
@end*/

参数2：每组注册cell的ID的数组,（注意数组的cellID的顺序）

参数3：block，block里面需要确定每组cell的真实类型，cell模型赋值

/*self.dataSource = [[LZBArrayDataSource alloc]initWithSectionItems:self.sectionArray cellIdentifiers:@[nomalCellID,LZBScaleTableViewCellID] configCellBlock:^(id cell, id item, NSInteger section) {
if(section == 0)
{
UITableViewCell *callBackCell = (UITableViewCell *)cell;
LZBScaleCellModel *model =  (LZBScaleCellModel *)item;
callBackCell.textLabel.text = model.title;
}
else
{
LZBScaleTableViewCell *callBackCell = (LZBScaleTableViewCell *)cell;
LZBScaleCellModel *model =  (LZBScaleCellModel *)item;
callBackCell.model = model;
}
}];*/
