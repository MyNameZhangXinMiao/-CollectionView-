# 仿照豆瓣的CollectionView左边滑动加载更多
![](https://github.com/MyNameZhangXinMiao/Material/blob/main/89ee72197dd1d0f5f855c4e13a103853.gif)

#### 使用说明

1.需要在你设置你的UICollectionView的下面的类和文件夹
  
  导入 #import "JKCurve.h"
  拖入 JKCollectionViewMoreCurveTool文件夹
  
2.定义下面三个属性

  // 定义 JKCurve对象
  @property(nonatomic,strong) JKCurve *jkCurve;
  // 用来判断的一个字段(初始值赋为 1)
  @property(nonatomic,strong) NSString *judge;
  // 右边加载更多的最大距离
  @property(nonatomic,assign) CGFloat maxPopDistance;
  // 右边加载更多的距离
  @property(nonatomic,assign) float popDistance;
  
3.在添加collectionView之后添加下面代码(collectionView要与JKCurve保持一个父类)

  self.maxPopDistance = 60;
  self.judge = @"1";
  self.jkCurve = [[JKCurve alloc]initWithFrame:CGRectMake(self.width, 0, 0, self.height) withType:@"加载更多"];
  // 这个self是collectionView与JKCurve的父类
  [self addSubview:self.jkCurve];

4.导入下面的两个方法

  #pragma mark 滑动的监听
  -(void)scrollViewDidScroll:(UIScrollView *)scrollView{

     // scrollView的x偏移量
     double offsetX = scrollView.contentOffset.x;

     if (offsetX<=0) return;

     double scrollViewX = offsetX+self.collectionView.width;

     // collectionView的滚动范围的 width
     float collectionContentSizeWidth = scrollView.contentSize.width;

     // 防止在走加载全部再次走下面
     if([self.judge isEqualToString: @"1"]){

        self.judge = @"0";
        return;
     }

     if (scrollViewX > collectionContentSizeWidth) {

        self.popDistance = (scrollViewX-collectionContentSizeWidth)*2;

        if (self.popDistance >= self.maxPopDistance) {

          self.popDistance = self.maxPopDistance;
        }

        self.jkCurve.controlPoint = CGPointMake(self.jkCurve.width-self.popDistance, self.jkCurve.height/2.0);

     }
   }

   #pragma mark 松开手的操作
   -(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
   {

      if (targetContentOffset->x == 0) return;

      if (self.popDistance == self.maxPopDistance) {

          self.judge = @"1";

          self.popDistance = 0;

          self.jkCurve.controlPoint = CGPointMake(self.jkCurve.width-1, self.jkCurve.height/2.0);

          // 在此做跳转页面的操作或者其他的操作，如果你这个类是自定义的，你可以在此用block把这个方法传出去
       }
    }
