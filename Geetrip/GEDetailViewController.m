//
//  GEDetailViewController.m
//  Geetrip
//
//  Created by chengfeng on 15/8/12.
//  Copyright (c) 2015年 Geetrip Inc. All rights reserved.
//

#import "GEDetailViewController.h"
#import "GEPlanOptionTableViewCell.h"
#import "GEPaymentViewController.h"
#import "GEPlanDetailNetworkHelp.h"

@interface GEDetailViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIView *customNavBar;
@property (nonatomic,strong) UITableView *myTableView;
@property (nonatomic,strong) UIView *tableHeaderView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) UIButton *toolButton;

@end

@implementation GEDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.myPlanModel.destname;

    self.dataArray = [GEPlanOptionModel getTestArray];
    [self loadTableView];
    [self loadToolBar];
}

- (void)loadTableView
{
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.contentInset = UIEdgeInsetsMake(0, 0, 60, 0);
    [self.view addSubview:self.myTableView];
    
    self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    self.myTableView.tableHeaderView = self.tableHeaderView;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH, 50)];
    label.text = @"罗小亨 共8人 2月9日-16日 8晚";
    [self.tableHeaderView addSubview:label];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 49, SCREEN_WIDTH, 0.5)];
    lineView.backgroundColor = [UIColor separator_gray_line_color];
    [self.tableHeaderView addSubview:lineView];
}

- (void)loadToolBar
{
    self.toolButton = [[UIButton alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 60, SCREEN_WIDTH - 40, 50)];
    self.toolButton.backgroundColor = [UIColor geRedColor];
    
    [self.toolButton setTitle:@" 确定并支付" forState:UIControlStateNormal];
    [self.toolButton setImage:[UIImage imageNamed:@"confirm"] forState:UIControlStateNormal];
    self.toolButton.contentEdgeInsets = UIEdgeInsetsMake(0, (SCREEN_WIDTH - 40)/2.0, 0, 0);
    self.toolButton.layer.cornerRadius = 12;
    self.toolButton.layer.masksToBounds = YES;
    [self.view addSubview:self.toolButton];
    
    CGFloat width = (SCREEN_WIDTH - 40) / 2.0 - 24;
    
    UIView *priceView = [[UIView alloc] initWithFrame:CGRectMake(13, 10, width, 30)];
    priceView.backgroundColor = [UIColor whiteColor];
    priceView.userInteractionEnabled = NO;
    priceView.layer.cornerRadius = 12;
    priceView.layer.masksToBounds = YES;
    priceView.alpha = 0.7;
    [self.toolButton addSubview:priceView];

    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(13, 10, width, 30)];
    priceLabel.textAlignment = NSTextAlignmentCenter;
    priceLabel.textColor = [UIColor blackColor];
    priceLabel.font = [UIFont systemFontOfSize:16];
    priceLabel.text = @"合计:￥230,031";
    [self.toolButton addSubview:priceLabel];
    
    [self.toolButton addTarget:self action:@selector(paymentCurrentOrder) forControlEvents:UIControlEventTouchUpInside];
}

- (void)paymentCurrentOrder{
    GEPaymentViewController *payVc = [[GEPaymentViewController alloc] init];
    [self.navigationController pushViewController:payVc animated:YES];
}

- (void)leftBarClicked
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //[self setBarColorClear:YES];
}

#pragma tableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GEPlanOptionModel *model = [self.dataArray objectAtIndex:indexPath.row];
    
    static NSString *reuseableId = @"GEPlanOptionTableViewCell";
    GEPlanOptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseableId];
    if (cell == nil) {
        cell = [[GEPlanOptionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseableId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.model = model;;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GEPlanOptionModel *model = [self.dataArray objectAtIndex:indexPath.row];
    return [GEPlanOptionTableViewCell getCellHeightFromModel:model];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
