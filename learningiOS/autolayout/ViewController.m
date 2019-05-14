//
//  ViewController.m
//  autolayout
//
//  Created by 陈磊 on 2019/5/9.
//  Copyright © 2019 sinosoft. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *firstc;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}
-(void)updateViewConstraints
{
    
}
/*
 
 1.align
     Leading Edges 选中的views们 左 对齐
 
     Trailing Edges  选中的views们 右 对齐
 
     Top Edges  选中的views们 上 对齐
 
     Bottom Edges  选中的views们 下 对齐
 
     Horizontal Centers 选中的views们 水平方向 中心对齐
 
     Vertical Centers 选中的views们  垂直方向 中心对齐
 
     Baselines 选中的views们基于 基线 对齐
 
     Horizontally in Container 选中的视图 相对于 父视图 进行 水平方向 对齐
 
     Vertical in Container 选中的视图 相对于 父视图 进行 垂直方向 对齐
 
     Update Frames None 再设置了这些约束之后不进行Frame的更改
 
     Update Frames Items of New Constraints 设置了这些约束之后 只更改选中的这些views的Frame
 
     Update Frames All Frames in Container 更改该 vc 里所有View的约束 (慎用!!!!!!)
 
 2.pin
     User Standard Value 是说使用标准的的值，而且这个值只有在是设置上下方向的时候才有用。默认的值其实就是距离 Bottom Layout Guide，也就是上下基线。下基线就是距离视图最底部。上基线就是距离StatusView下方的位置。而这里的默认值其实是8
 
     User Current Canvas Value 使用当前位置设置。默认为当前设置方向最近的一个VIew，且没有覆盖遮挡的视图
     剩下的选项，会根据当前视图的布置情况有所不同，但是道理相当，这个选项是让你设置你要根据那个视图进行当前位置距离的设置的
 
 
 
     Width 和 Height 这个不需要我赘述了吧。分别是 宽度和高度 的设置
 
     Constarain to Margins. 这个是否需要外边距 默认为 8 。一般没啥卵用，都会去掉
 
     Equal Widths 和 Equal Heights 这两个选项需要选择两个视图。比如选中View1和View2，那么可以分别设置这个两个视图宽度和高度相等
 
     Aspect Ratio 这个属性是设置选中View的比例。当你点击设置的时候，默认他会设置当前视图的比例。比如你的View高度为40宽度为30。那么你的比例就将设置为3:4. 如果你希望修改这个比例的属性，咱们在讲完这三个东西之后，我会讲解
 
     Align 这个东西你不得不承认这个东西和咱们学习的第一个Align重复的… 在这里就不赘述了
 
     Update Frames 这个查看上面 Align选项的这个属性就好了
 3.resole auto layout issues
     Update Frames 修改Frame，当你的约束设置正确但是Frame不对的时候使用者选项可以讲View的Frame展示成为约束所描述的样子
 
     Update Constaints 而这个选项，说实话我没用过。他的意思咱们也可以知道他是通过Frame 去修改 约束……
 
     Add Missing Constraints 添加缺失的约束，这个选项我也没使用过，因为这个方法添加的缺失的约束不一定就是正确的约束，在实际运行中肯定会出现问题所以尽量自己把缺失的约束自己添加了。
 
     Reset to Suggested Constaints 重新设置建议的约束？没使用过，不知道什么意思
 
     Clear Constraints 清除约束，会删除选中的视图的所有的约束。在All Views in View Controller 你要是做这个选项的时候可得慎重，使用了就说明你要删除当前VC所有的约束。当然你可以 ctrl-z
 
 4.translatesAutoresizingMaskIntoConstraints
     把 autoresizingMask 转换为 Constraints
     即：可以把 frame ，bouds，center 方式布局的视图自动转化为约束形式。（此时该视图上约束已经足够 不需要手动去添加别的约束）
 
 
 
     用代码创建的所有view ，  translatesAutoresizingMaskIntoConstraints 默认是 YES
     用 IB 创建的所有 view ，translatesAutoresizingMaskIntoConstraints 默认是 NO (autoresize 布局:YES , autolayout布局 :NO)
 
 5. 如何设置 translatesAutoresizingMaskIntoConstraints:
 
     视图 使用代码创建，frame 布局 ，不用去管 translatesAutoresizingMaskIntoConstraints
     视图 使用代码创建，autolayout 布局，translatesAutoresizingMaskIntoConstraints 设置为 NO
     视图 IB 创建，frame 布局 , translatesAutoresizingMaskIntoConstraints 不用管 (IB 帮我们设置好了：YES)
     视图 IB 创建，autolayout 布局，translatesAutoresizingMaskIntoConstraints 不用管 (IB 帮我们设置好了，NO)
 
 6.
 
 
 
 
 
 
 
 
 
 */

@end
